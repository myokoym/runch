require "runch/language/c"
require "runch/language/java"

module Runch
  module Language
    module_function
    def create(main_source, *files)
      extname = File.extname(main_source)[1..-1]
      const_get(extname.capitalize).new(main_source, files)
    end
  end
end
