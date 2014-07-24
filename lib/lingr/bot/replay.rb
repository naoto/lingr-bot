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
        Dir[File.join(File.expand_path('plugins'), '*.rb')]
        plugins << Lingr::Bot.const_get(Rinne.camelize(File.basename(file, '.rb')))
      end
      plugins
    end

  end
end
