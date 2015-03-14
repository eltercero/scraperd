require 'simple-rss'
require 'open-uri'
require 'pry'

require 'scraperd/activity'
require 'scraperd/error'

module Scraperd
  class Base

    BASE_URL = "http://letterboxd.com/"

    def fetch(username)
      raise Scraperd::Error::BadRequest.new('options must be in a Hash') unless username
      
      rss = SimpleRSS.parse(open("#{BASE_URL}#{username}/rss"))
      rss.items.map{|item| Scraperd::Activity.new(item)}
    end
    
  end
end