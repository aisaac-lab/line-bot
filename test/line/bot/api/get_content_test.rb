require 'test_helper'

class Line::Bot::API::GetContentTest < Minitest::Test
  def setup
    @sample_mids = ["u309c9dcccb65b69c8dcdfc52f391aa03"]
  end

  def test_get_message
    response = $client.get_message_content "xxxxxxxxxx"
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"542", "statusMessage"=>"BOT_INVALID_PARAMETER"},
      response[:body]
    )
  end
end
