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
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir["lib/**/*", "CHANGELOG", "LICENSE", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "sai", "~> 0.4"
end
