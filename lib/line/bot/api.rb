require 'line/bot/request'

require 'line/bot/api/profile'
require 'line/bot/api/get_message'
require 'line/bot/api/send_message'

module Line
  module Bot
    module API
      include Line::Bot::API::Profile
      include Line::Bot::API::GetMessage
      include Line::Bot::API::SendMessage

      private
        def perform_get_request(path, options)
          perform_request(:get, path, options)
        end

        def perform_post_request(path, options)
          perform_request(:post, path, options)
        end

        def perform_request(request_method, path, options)
          Line::Bot::Request.new(self, request_method, path, options).perform
        end
    end
  end
end
