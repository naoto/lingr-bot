module Lingr::Bot
  class Replay

    def self.send(message)
      new(message).text
    end

    def initialize(message)
      text = nil
      plugins.each do |plugin|
        text ||= plugin.replay message
      end
      text
    end

    def plugins
      @@Plugins ||= load_plugin
    end

    def load_plugin
      plugins = []
      Dir::glob("plugins/*.rb").each do |file|
        require "plugins/#{File.basename(file)}"
        plugins << const_get(File.basename(file, '.rb').camelize)
      end
      plugins
    end

  end
end
