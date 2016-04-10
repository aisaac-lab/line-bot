module Line
  module Bot
    module API
      module GetMessage
        # @param messageId String or Integer
        def get_message_content(messageId)
          perform_get_request "/v1/bot/message/#{messageId}/content", {}
        end
      end
    end
  end
end
