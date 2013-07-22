require "tmpdir"

module Runch
  module Language
    module Base
    def initialize(main_source, files)
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
      @main_source
    end

    def execute(executable)
      system(executable)
    end
    end
  end
end
