require 'mechanize'
require 'open-uri'

class Url

  def reply(message)
    URI.extract(message.text, %w(http https)).map { |uri| page_title(uri) }.each do |title|
      return title
    end
  end

 
private
    def page_title(uri)
      case uri
      when /twitter.com/
        get_tweet(uri)
      else
        Nokogiri::HTML(open(URI.escape(uri))).title
      end
    end

    def get_tweet(uri)
      body = Nokogiri::HTML(open(URI.escape(uri.gsub('#!/', ''))))
      username = body.at('.js-action-profile-name b').text
      tweet = body.at('.tweet-text').text.strip
      datetime = body.at('.client-and-actions span.metadata span').text
      "@#{username}: #{tweet} - #{datetime}"
    rescue Mechanize::ResponseCodeError
      "Sorry, that page doesn't exist! by Twitter.com"
    rescue
      'Undefined Error'
    end

end
