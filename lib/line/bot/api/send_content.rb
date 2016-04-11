require 'line/bot/constants'

module Line
  module Bot
    module API
      module SendContent
        include Line::Bot::Constants

        # @param mids [String]
        # @param [Hash] content_params
        # @option content_params [String] :text String you want to send. Messages can contain up to 1024 characters.
        def send_text(mids, content_params)
          perform_sending_message_request(mids, ContentType::TEXT, content_params)
        end

        # @param mids [String]
        # @param [Hash] content_params
        # @option content_params [String] :originalContentUrl URL of image. Only JPEG format supported. Image size cannot be larger than 1024×1024.
        # @option content_params [String] :previewImageUrl URL of thumbnail image. For preview. Only JPEG format supported. Image size cannot be larger than 240×240.
        def send_image(mids, content_params)
          perform_sending_message_request(mids, ContentType::IMAGE, content_params)
        end

        # @param mids [String]
        # @param [Hash] content_params
        # @option content_params [String] :originalContentUrl URL of the movie. The “mp4” format is recommended.
        # @option content_params [String] :previewImageUrl URL of thumbnail image used as a preview.
        def send_video(mids, content_params)
          perform_sending_message_request(mids, ContentType::VIDEO, content_params)
        end

        # @param mids [String]
        # @param [Hash] content_params
        # @option content_params [String] :originalContentUrl URL of audio file. The “m4a” format is recommended.
        # @option content_params [String] :contentMetadata["AUDLEN"] Length of voice message. The unit is given in milliseconds.
        def send_audio(mids, content_params)
          perform_sending_message_request(mids, ContentType::AUDIO, content_params)
        end

        # @param mids [String]
        # @param [Hash] content_params
        # @option content_params [String] :text String used to explain the location information (example: name of restaurant, address).
        # @option content_params [String] :location["title"] Assigned the same string as the text property.
        # @option content_params [String] :location["latitude"] Latitude.
        # @option content_params [String] :location["longitude"] Longitude.
        def send_location(mids, content_params)
          perform_sending_message_request(mids, ContentType::LOCATION, content_params)
        end

        # @param mids [String]
        # @param [Hash] content_params
        # @option content_params [String] :contentMetadata["STKID"] ID of the sticker.
        # @option content_params [String] :contentMetadata["STKPKGID"] Package ID of the sticker.
        # @option content_params [String] :contentMetadata["STKVER"] Optional. Version number of the sticker. If omitted, the latest version number is applied.
        def send_sticker(mids, content_params)
          perform_sending_message_request(mids, ContentType::STICKER, content_params)
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
