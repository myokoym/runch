require "tmpdir"

module Runch
  class Command
    class << self
      def run(*arguments)
        new.run(arguments)
      end
    end

    def initialize
    end

    def run(arguments)
      Dir.mktmpdir("runch") do |dir|
        arguments.each do |file|
          FileUtils.cp(file, dir)
          basename = File.basename(file, ".*")
          filename = File.basename(file)
          main_source = "#{dir}/#{filename}"
          executable = "#{dir}/#{basename}"
          system("gcc", "-o", executable, main_source)
          system(executable)
        end
      end
    end
  end
end
