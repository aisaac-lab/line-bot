require 'line/bot/request'

require 'line/bot/api/profile'
require 'line/bot/api/retrieve_message'
require 'line/bot/api/send_message'

module Line
  module Bot
    module API
      include Line::Bot::API::Profile
      include Line::Bot::API::RetrieveMessage
      include Line::Bot::API::SendMessage

      private
        def perform_request(request_method, path, options)
          Line::Bot::Request.new(self, request_method, path, options).perform
        end
    end
  end
end
