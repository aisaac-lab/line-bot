require 'test_helper'

class Line::Bot::RequestTest < Minitest::Test
  def test_perform_200
    response = Line::Bot::Request.new($client, :get, '/v1/profiles', { mids: ENV["LINE_CHANNEL_MID"] }).perform

    assert_equal 200, response[:status]
    refute_nil response[:body]["contacts"]
  end

  def test_perform_404
    response = Line::Bot::Request.new($client, :get, '/v1/wrong_path').perform

    assert_equal 404, response[:status]
    assert_equal(
      {
        "statusCode"=>"404", "statusMessage"=>"No mapping found for HTTP request"
      },
      response[:body]
    )
  end

  def test_perform_500
    response = Line::Bot::Request.new($client, :get, '/v1/profiles', { wrong_prams: "" }).perform

    assert_equal 500, response[:status]
    assert_equal(
      {
        "statusCode"=>"400","statusMessage"=>"Required String parameter 'mids' is not present"
      },
      response[:body]
    )
  end

  # :status=>400, :body=>{"statusCode"=>"422", "statusMessage"=>"empty content."}}
end
