module Lingr::Bot
  class Server < Sinatra::Base

    get '/' do
    end

    post '/' do
      request.body.rewind
      message = Message.new(request.body)
      Reply.toke message
    end

  end
end
