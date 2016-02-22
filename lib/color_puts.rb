require "color_puts/version"

module ColorPuts
  COLORS = {
    black: '0;30',
    dblue: '0;34',
    dgreen: '0;32',
    dcyan: '0;36',
    dred: '0;31',
    dpurple: '0;35',
    dgray: '1;30',
    brown: '0;33',
    gray: '0;37',
    blue: '1;34',
    green: '1;32',
    cyan: '1;36',
    red: '1;31',
    purple: '1;35',
    yellow: '1;33',
    white: '1;37'
  }

  # Example:
  #
  #  cputs "There was a %green{field} and %blue{sky}."
  #
  def cputs(string = "")
    regexp = /%(\w+)\{[^}]*./
    text_regexp = /%\w+{(.*)}/

    string = string.dup

    while m = string.match(regexp) do
      string.gsub!(m.to_s) do |s|
        color = ColorPuts::COLORS[m.captures.first.to_sym]
        text = s.match(text_regexp).captures.first
        "\e[#{color}m#{text}\e[0;39m"
      end
    end

    puts string
  end
end
