require 'test_helper'

class Line::Bot::ClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Line::Bot::VERSION
  end
end
