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
      Language.create(arguments[0], arguments[1..-1]).run
    end
  end
end
