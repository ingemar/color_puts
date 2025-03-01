# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"
require "minitest/reporters"

require "color_puts"

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new
