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
          system("gcc", "-o", "#{dir}/#{basename}", file)
          system("#{dir}/#{basename}")
        end
      end
    end
  end
end
