module Line
  module Bot
    module API
      module GetContent
        # @param messageId String or Integer
        def get_message_content(messageId)
          perform_get_request "/v1/bot/message/#{messageId}/content", {}
        end

        def get_message_content_preview(messageId)
          perform_get_request "/v1/bot/message/#{messageId}/content/preview", {}
        end
      end
    end
  end
end
