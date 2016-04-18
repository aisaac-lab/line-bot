module Line
  module Bot
    class Message
      class Content
        attr_reader :location, :id, :content_type, :from, :created_time,
                    :to, :to_type, :content_metadata, :text

        def initialize json
          @location         = json['location']
          @id               = json['id']
          @content_type     = json['contentType']
          @from             = json['from']
          @created_time     = json['createdTime']
          @to               = json['to']
          @to_type          = json['toType']
          @content_metadata = json['contentMetadata']
          @text             = json['text']
        end
      end

      attr_reader :from, :from_channel, :to, :to_channel, :event_type, :id,
                  :content

      def initialize json
        @from         = json['from']
        @from_channel = json['fromChannel']
        @to           = json['to']
        @to_channel   = json['toChannel']
        @event_type   = json['eventType']
        @id           = json['id']
        @content      = Content.new json['content']
      end

    end
  end
end
