require 'test_helper'

class Line::Bot::ApiTest < Minitest::Test
  def test_get_profiles
    assert_equal "Aisaac", $client.get_profiles(mids: "u765af0c40544c84c52d7a2772021380b")["contacts"].first["displayName"]
  end
end
