module Line
  module Bot
    module API
      module Profile
        # @param mids [String]
        def get_profiles(mids)
          perform_get_request '/v1/profiles', {
            mids: mids.join(",")
          }
        end
      end
    end
  end
end
