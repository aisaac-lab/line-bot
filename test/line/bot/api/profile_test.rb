require 'test_helper'

class Line::Bot::API::ProfileTest < Minitest::Test
  def setup
    @sample_mids = ["u309c9dcccb65b69c8dcdfc52f391aa02"]
  end

  def test_get_profiles
    response = $client.get_profiles(@sample_mids)

    assert_equal 200, response[:status]
    refute_nil response[:body]["contacts"]
  end
end
