# frozen_string_literal: true

require "sai"

module ColorPuts
  REGEXP = /\((\w+|#[0-9A-Fa-f]{6})\)\[([^\]]+)\]/
  private_constant :REGEXP

  RAINBOW = 20
  private_constant :RAINBOW

  DECORATOR = Sai::Decorator.new(mode: Sai.mode.auto)
  private_constant :DECORATOR

  class NullDecorator
    def self.decorate(string) = string
  end

  # Example:
  #
  #  colorize("There was a (green)[field] and (blue)[sky].")
  #
  def self.colorize(string, decorator: DECORATOR)
    Sai::Registry.send(:lookup).keys
    Sai::ANSI::STYLES.keys

    string
      .dup
      .gsub(REGEXP) do |markdown|
        color, text = markdown.scan(REGEXP)[0]

        if color.start_with?("#") then decorator.hex(color)
        elsif color == "rainbow" then decorator.rainbow(RAINBOW)
        elsif Sai::ANSI::STYLES.key?(color.to_sym) then decorator.public_send(color)
        elsif Sai::Registry.send(:lookup).key?(color.sub(/\Aon_/, "").to_sym) then decorator.public_send(color)
        else
          NullDecorator
        end
          .decorate(text)
          .to_s
      end
  end

  def colorize(...)
    ColorPuts.colorize(...)
  end
end
