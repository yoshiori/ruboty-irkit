require "json"
require "httparty"

module Ruboty
  module Handlers
    class Irkit < Base
      NAMESPACE = "irkit"
      env :IRKIT_JSON_URL, "IRKit JSON data url. (see: https://github.com/shokai/ruby-irkit)"
      env :IRKIT_CLIENTKEY, "IRKit clientkey"
      env :IRKIT_DEVICEID, "IRKit deviceid."

      on(
        /list irkit\z/,
        name: "list",
        description: "List irkit jobs",
      )

      on(
        /reload irkit\z/,
        name: "reload",
        description: "Reload irkit data",
      )

      on(
        /irkit (?<job>.+)\z/m,
        name: "post",
        description: "Post irkit job",
      )

      private

      def list(message)
        message.reply(table.keys.join("\n"), code: true)
      end

      def reload(message)
        robot.brain.data[NAMESPACE] = load
        message.reply("reload done")
      end

      def post(message)
        ir_data = table[message[:job]]
        unless ir_data
          message.reply("IRKit job not found.")
          return
        end
        irkit.post_messages(ir_data)
        message.reply("Execute #{message[:job]} to IRKit.")
      end

      def irkit
        @irkit ||= Ruboty::Irkit::Client.new(
          clientkey: ENV["IRKIT_CLIENTKEY"],
          deviceid: ENV["IRKIT_DEVICEID"],
        )
      end

      def table
        robot.brain.data[NAMESPACE] ||= load
      end

      def load
        response = HTTParty.get(ENV["IRKIT_JSON_URL"], follow_redirects: true)
        JSON.parse(response.body)["IR"]
      end
    end
  end
end
