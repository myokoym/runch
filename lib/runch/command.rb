require "runch/language"

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
      Language.new(arguments).run
    end
  end
end
