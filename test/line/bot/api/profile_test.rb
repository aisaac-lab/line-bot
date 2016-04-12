require 'test_helper'

class Line::Bot::API::ProfileTest < Minitest::Test
  def setup
    @sample_mids = ["u309c9dcccb65b69c8dcdfc52f391aa0a"]
    @sample_multi_mids = ["u8991f6c6c26e247ea6a33fbc143226de", "uab0e0158e0214202b7302f11276d2edc"]
  end

  def test_get_profiles
    response = $client.get_profiles @sample_mids
    assert_equal 200, response[:status]
    refute_nil response[:body]["contacts"]
  end

  def test_get_multi_profiles
    response = $client.get_profiles @sample_multi_mids
    assert_equal 200, response[:status]
    assert_equal 2, response[:body]["contacts"].count
  end
end
