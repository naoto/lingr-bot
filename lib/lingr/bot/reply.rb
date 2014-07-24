module Lingr::Bot
  class Reply

    def self.toke(message)
      new(message).text
    end

    def initialize(message)
      text = nil
      plugins.each do |plugin|
        text ||= plugin.reply message
      end
      text
    end

    def plugins
      @@Plugins ||= load_plugin
    end

    def load_plugin
      plugins = []
      Dir[File.join(File.expand_path('plugins'), '*.rb')].each do |file|
        require file
        plugins << Object.const_get(Rinne.camelize(File.basename(file, '.rb'))).new
      end
      plugins
    end

  end
end
