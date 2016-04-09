require 'line/bot/client'

module EventType
  RECEIVED_MESSAGE   = "138311609000106303"
  RECEIVED_OPERATION = "138311609100106403"
  POST_EVENT_API     = "138311608800106203"
end

POST_EVENT_API_CHANEL_ID = "1383378250"

module ContentType
  TEXT     = 1
  IMAGE    = 2
  VIDEO    = 3
  AUDIO    = 4
  LOCATION = 7
  STICKER  = 8
  CONTACT  = 10
end

module ToType
  USER = 1
end
