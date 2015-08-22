require "httparty"

module Ruboty
  module Irkit
    class Client
      IRKIT_API = "https://api.getirkit.com/1"

      def initialize(clientkey:, deviceid:)
        @clientkey = clientkey
        @deviceid = deviceid
      end

      def post_messages(data)
        HTTParty.post(
          "#{IRKIT_API}/messages",
          body: {
            deviceid: @deviceid,
            clientkey: @clientkey,
            message: data.to_json,
          },
        )
      end
    end
  end
end
