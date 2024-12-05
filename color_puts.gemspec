lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "color_puts/version"

Gem::Specification.new do |spec|
  spec.name = "color_puts"
  spec.version = ColorPuts::VERSION
  spec.authors = ["Ingemar"]
  spec.email = ["ingemar@xox.se"]

  spec.summary = "Color your output text"
  spec.description = "Color your output with inline color codes"
  spec.homepage = "https://github.com/ingemar/color_puts"
  spec.license = "MIT"

  spec.required_ruby_version = ">= 3.2"
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]
end
