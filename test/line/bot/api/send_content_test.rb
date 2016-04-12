require 'test_helper'

class Line::Bot::API::SendContentTest < Minitest::Test
  def setup
    @sample_mids = ["u8991f6c6c26e247ea6a33fbc143226dd"]
    @sample_image_url = "http://aisaac.in//img/logo_white.png"
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
      originalContentUrl: @sample_image_url,
      previewImageUrl: @sample_image_url
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
      previewImageUrl: @sample_image_url
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

  def test_send_audio
    response = $client.send_audio(@sample_mids,
      originalContentUrl: "http://example.com/original.m4a",
      contentMetadata: {
        "AUDLEN" => "240000"
      }
    )
    assert_equal 200, response[:status]
    refute_nil response[:body]["messageId"]
  end

  def test_send_location
    response = $client.send_location(@sample_mids,
      text: "Hi!",
      location: {
        title: "Convention center",
        latitude: 35.61823286112982,
        longitude: 139.72824096679688
      }
    )
    assert_equal 200, response[:status]
    refute_nil response[:body]["messageId"]
  end

  def test_send_sticker
    response = $client.send_sticker(@sample_mids,
      contentMetadata: {
        "STKVER"=>"100",
        "STKID"=>"140",
        "STKPKGID"=>"2"
      }
    )
    assert_equal 200, response[:status]
    refute_nil response[:body]["messageId"]

    response = $client.send_sticker(@sample_mids,
      contentMetadata: {
        wrong_params: "xxx"
      }
    )
    assert_equal 400, response[:status]
    assert_equal(
      {"statusCode"=>"542", "statusMessage"=>"BOT_INVALID_PARAMETER"},
      response[:body]
    )
  end
end
