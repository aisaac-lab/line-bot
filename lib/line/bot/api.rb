require 'line/bot/request'

module Line
  module Bot
    module API
      def get_profiles(options = {})
        perform_get('/v1/profiles', options)
      end

      private
        def perform_get(path, options)
          perform_request(:get, path, options)
        end

        def perform_request(request_method, path, options)
          Line::Bot::Request.new(self, request_method, path, options).perform
        end
    end
  end
end
