require "tmpdir"

module Runch
  class Language
    def initialize(main_source, *files)
      @main_source = main_source
      @files = files
    end

    def run
      Dir.mktmpdir("runch") do |dir|
        copy(dir)
        executable = compile(dir)
        execute(executable)
      end
    end

    private
    def copy(dir)
      FileUtils.cp(@main_source, dir)
      @files.each do |file|
        FileUtils.cp_r(file, dir)
      end
    end

    def compile(dir)
      basename = File.basename(@main_source, ".*")
      filename = File.basename(@main_source)
      main_source = File.join(dir, filename)
      executable = File.join(dir, basename)
      system("gcc", "-o", executable, main_source)
      executable
    end

    def execute(executable)
      system(executable)
    end
  end
end
