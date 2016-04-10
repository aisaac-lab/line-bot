require 'line/bot/constants'

module Line
  module Bot
    module API
      module SendContent
        include Line::Bot::Constants

        # @param mids [String]
        # @param text_message String
        def send_text(mids, content_params)
          perform_sending_message_request(mids, ContentType::TEXT, content_params)
        end

        def send_image(mids, content_params)
          perform_sending_message_request(mids, ContentType::IMAGE, content_params)
        end

        def send_video(mids, content_params)
          perform_sending_message_request(mids, ContentType::VIDEO, content_params)
        end

        def send_audio(mids, content_params)
          perform_sending_message_request(mids, ContentType::AUDIO, content_params)
        end

        def send_location(mids, content_params)
          perform_sending_message_request(mids, ContentType::LOCATION, content_params)
        end

        def send_sticker(mids, content_params)
          perform_sending_message_request(mids, ContentType::STICKER, content_params)
        end

        def send_contact(mids, content_params)
          perform_sending_message_request(mids, ContentType::CONTACT, content_params)
        end
      end

      private
        def perform_sending_message_request(mids, contentType, content_params)
          perform_post_request '/v1/events', {
            to: mids,
            content: {
              toType: ToType::USER,
              contentType: contentType
            }.merge(content_params),
            toChannel: POST_EVENT_API_CHANEL_ID,
            eventType: EventType::POST_EVENT_API
          }
        end
    end
  end
end
