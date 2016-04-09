module Line
  module Bot
    module API
      module Profile
        # @param mids [String]
        def get_profiles(mids)
          perform_request(:get, '/v1/profiles', {
            mids: mids.join(",")
          })
        end
      end
    end
  end
end
