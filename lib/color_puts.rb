# frozen_string_literal: true

module ColorPuts
  COLORS = {
    "black" => "0;30",
    "dblue" => "0;34",
    "dgreen" => "0;32",
    "dcyan" => "0;36",
    "dred" => "0;31",
    "dpurple" => "0;35",
    "dgray" => "1;30",
    "brown" => "0;33",
    "gray" => "0;37",
    "blue" => "1;34",
    "green" => "1;32",
    "cyan" => "1;36",
    "red" => "1;31",
    "purple" => "1;35",
    "yellow" => "1;33",
    "white" => "1;37"
  }.freeze

  REGEXP = /%(#{COLORS.keys.join("|")})\{([^}]*)\}/
  private_constant :REGEXP

  TEMPLATE = "\e[%<color>sm%<text>s\e[0;39m"
  private_constant :TEMPLATE

  # Example:
  #
  #  colorize("There was a %green{field} and %blue{sky}.")
  #
  def colorize(string)
    string
      .dup
      .gsub(REGEXP) do |match|
        color, text = match.match(REGEXP).captures

        TEMPLATE % {color: COLORS[color], text:}
      end
  end

  def cputs(string = "") = puts colorize(string)
end
