require "tmpdir"

module Runch
  class Language
    def initialize(main_source, *files)
      @main_source = main_source
      @files = files
    end

    def run
      Dir.mktmpdir("runch") do |tmpdir|
        copy(tmpdir)
        executable = compile(tmpdir)
        execute(executable)
      end
    end

    private
    def copy(tmpdir)
      FileUtils.cp(@main_source, tmpdir)
      @files.each do |file|
        FileUtils.cp_r(file, tmpdir)
      end
    end

    def compile(tmpdir)
      basename = File.basename(@main_source, ".*")
      filename = File.basename(@main_source)
      main_source = File.join(tmpdir, filename)
      executable = File.join(tmpdir, basename)
      system("gcc", "-o", executable, main_source)
      executable
    end

    def execute(executable)
      system(executable)
    end
  end
end
