# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'runch/version'

Gem::Specification.new do |spec|
  spec.name          = "runch"
  spec.version       = Runch::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]
  spec.description   = %q{A launcher for source code as interpreter.}
  spec.summary       = %q{A launcher for source code as interpreter.}
  spec.homepage      = "https://github.com/myokoym/runch"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency("bundler", "~> 1.3")
  spec.add_development_dependency("rake")
end
