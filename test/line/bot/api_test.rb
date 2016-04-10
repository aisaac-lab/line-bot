require 'test_helper'

class Line::Bot::ApiTest < Minitest::Test
  def setup
    @sample_mids = ["u309c9dcccb65b69c8dcdfc52f391aa02"]
    @sample_messageId = "1460267200057"
  end

  def test_get_profiles
    response = $client.get_profiles(@sample_mids)

    assert_equal 200, response[:status]
    refute_nil response[:body]["contacts"]
  end

  def test_send_text
    response = $client.send_text(@sample_mids, "Hello world")
    assert_equal 200, response[:status]
    refute_nil response[:body]["messageId"]

    response = $client.send_text(@sample_mids, "")
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"422", "statusMessage"=>"text can not be empty for this content type : TEXT"},
      response[:body]
    )

    response = $client.send_text(["wrong_mid"], "Hello world")
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"422", "statusMessage"=>"invalid users"},
      response[:body]
    )
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
