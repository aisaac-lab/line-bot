require 'test_helper'

class Line::Bot::API::SendContentTest < Minitest::Test
  def setup
    @sample_mids = ["u309c9dcccb65b69c8dcdfc52f391aa02"]
  end

  def test_send_text
    response = $client.send_text(@sample_mids, text: "Hello world")
    assert_equal 200, response[:status]
    refute_nil response[:body]["messageId"]

    response = $client.send_text(@sample_mids, text: "")
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"422", "statusMessage"=>"text can not be empty for this content type : TEXT"},
      response[:body]
    )

    response = $client.send_text(["wrong_mid"], text: "Hello world")
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"422", "statusMessage"=>"invalid users"},
      response[:body]
    )
  end

  def test_send_image
    response = $client.send_image(@sample_mids,
      originalContentUrl: "http://example.com/original.jpg",
      previewImageUrl: "http://example.com/preview.jpg"
    )
    assert_equal 200, response[:status]
    refute_nil response[:body]["messageId"]

    response = $client.send_video(@sample_mids, text: "")
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"422", "statusMessage"=>"originalContentUrl can not be empty for this content type : VIDEO"},
      response[:body]
    )

    response = $client.send_video(["wrong_mid"], text: "Hello world")
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"422", "statusMessage"=>"invalid users"},
      response[:body]
    )
  end

  def test_send_video
    response = $client.send_video(@sample_mids,
      originalContentUrl: "http://example.com/original.jpg",
      previewImageUrl: "http://example.com/preview.jpg"
    )
    assert_equal 200, response[:status]
    refute_nil response[:body]["messageId"]

    response = $client.send_video(@sample_mids, text: "")
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"422", "statusMessage"=>"originalContentUrl can not be empty for this content type : VIDEO"},
      response[:body]
    )

    response = $client.send_video(["wrong_mid"], text: "Hello world")
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"422", "statusMessage"=>"invalid users"},
      response[:body]
    )
  end
end
