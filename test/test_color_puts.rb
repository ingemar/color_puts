# frozen_string_literal: true

require "test_helper"

class TestColorPuts < Minitest::Test
  describe "#colorize" do
    it "colorizes a string" do
      expected = "A \e[1mbold\e[0m, \e[38;2;255;0;0mbright red boat\e[0m with an \e[38;2;255;128;0morange sail\e[0m was\nsailing \e[48;2;0;0;238mon a blue sea\e[0m with \e[38;2;255;0;0ma\e[0m \e[38;2;255;112;0mr\e[0m\e[38;2;255;168;0ma\e[0m\e[38;2;255;224;0mi\e[0m\e[38;2;222;246;0mn\e[0m\e[38;2;175;255;0mb\e[0m\e[38;2;119;255;0mo\e[0m\e[38;2;63;255;0mw\e[0m \e[38;2;0;255;49mi\e[0m\e[38;2;0;255;105mn\e[0m \e[38;2;0;255;217mt\e[0m\e[38;2;0;237;255mh\e[0m\e[38;2;0;182;255me\e[0m \e[38;2;0;70;255mb\e[0m\e[38;2;8;22;255ma\e[0m\e[38;2;45;3;255mc\e[0m\e[38;2;98;0;255mk\e[0m\e[38;2;154;0;255mg\e[0m\e[38;2;208;0;253mr\e[0m\e[38;2;245;0;235mo\e[0m\e[38;2;255;0;189mu\e[0m\e[38;2;255;0;132mn\e[0m\e[38;2;255;0;76md\e[0m.\n"

      result = ColorPuts.colorize(<<~TEXT)
        A (bold)[bold], (bright_red)[bright red boat] with an (#FF8000)[orange sail] was
        sailing (on_blue)[on a blue sea] with (rainbow)[a rainbow in the background].
      TEXT

      assert_equal expected, result
    end

    it "ignores unknown colors" do
      string = "(unknown)[plain text]"

      result = ColorPuts.colorize(string)

      assert_equal "plain text", result
    end
  end
end
