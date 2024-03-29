require "lingr/bot/version"

module Lingr
  module Bot
    # Your code goes here...
    require 'json'
    require 'sinatra'
    require 'optparse'
    require 'rinne'

    require 'lingr/bot/server'
    require 'lingr/bot/message'
    require 'lingr/bot/reply'
    require 'lingr/bot/option'


    def self.start(option)
      Server.run!(Option.load(option))
    end

  end
end
