# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color_puts/version'

Gem::Specification.new do |spec|
  spec.name          = "color_puts"
  spec.version       = ColorPuts::VERSION
  spec.authors       = ["Ingemar"]
  spec.email         = ["ingemar@xox.se"]

  spec.summary       = %q{Color your output text}
  spec.description   = %q{Color your output with inline color codes}
  spec.homepage      = "https://github.com/ingemar/color_puts"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
end
