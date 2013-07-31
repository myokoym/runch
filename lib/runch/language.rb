require "runch/language/c"
require "runch/language/cc"
require "runch/language/java"

module Runch
  module Language
    module_function
    def create(main_source, *files)
      extname = File.extname(main_source)[1..-1]
      if /\A(cc|cp|cpp|cxx)\z/ =~ extname
        CC.new(main_source, files)
      else
        const_get(extname.capitalize).new(main_source, files)
      end
    end
  end
end
