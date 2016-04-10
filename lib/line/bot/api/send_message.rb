module Line
  module Bot
    module API
      module SendMessage
        # @param mids [String]
        # @param text_message String
        def send_text(mids, text_message)
          perform_post_request '/v1/events', {
            to: mids,
            content: {
              contentType: ContentType::TEXT,
              toType: ToType::USER,
              text: text_message
            },
            toChannel: POST_EVENT_API_CHANEL_ID,
            eventType: EventType::POST_EVENT_API
          }
        end
      end
    end
  end
end
