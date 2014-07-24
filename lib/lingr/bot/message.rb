module Lingr::Bot
  class Message

    def initialize(body)
      @data = (JSON.parse body.read rescue {})
    end

    def room
      @data["events"]["message"]["room"]
    end

    def nickname
      @daat["events"]["message"]["nickname"]
    end

    def text
      @data["events"]["message"]["text"]
    end

  end
end
