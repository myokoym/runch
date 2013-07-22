require "runch/language/base"

module Runch
  module Language
    class C
      include Base

      def compile(tmpdir)
        basename = File.basename(@main_source, ".*")
        filename = File.basename(@main_source)
        main_source = File.join(tmpdir, filename)
        executable = File.join(tmpdir, basename)
        system("gcc", "-o", executable, main_source)
        executable
      end
    end
  end
end
