require "runch/language/base"

module Runch
  module Language
    class Java
      include Base

      def compile(tmpdir)
        basename = File.basename(@main_source, ".*")
        filename = File.basename(@main_source)
        main_source = File.join(tmpdir, filename)
        executable = File.join(tmpdir, basename)
        system("javac", main_source)
        executable
      end

      def execute(executable)
        dirname = File.dirname(executable)
        classname = File.basename(executable)
        system("java", "-classpath", dirname, classname)
      end
    end
  end
end
