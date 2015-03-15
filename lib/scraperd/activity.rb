require 'simple-rss'
require 'ostruct'
require 'pry'

module Scraperd
  class Activity < ::OpenStruct
    
    def initialize(item)
      super(Hashie::Mash.new({
          id:         item[:guid].force_encoding("UTF-8"),
          title:      title_from_title(item[:title]),
          score:      score_from_title(item[:title]),
          link:       item[:link].force_encoding("UTF-8"),
          film_link:  "http://letterboxd.com/film/#{nicetitle_from_url(item[:link])}/".force_encoding("UTF-8"),
          watched_at: watched_at_from_description(item[:description]),
          added_at:   item[:pubDate]
        })
      )      
    end

    def nicetitle_from_url(url)
      url.split('/').last
    end

    def watched_at_from_description(description)
      string_date = description.match(/<p>Watched on (.*)<\/p>/)[1]
      Time.parse string_date
    end

    def title_from_title(title)
      title.split(' - ')[0..-2].join(' - ').force_encoding("UTF-8")
    end

    def score_from_title(title)
      html_score = title.split(' - ').last
      html_score.force_encoding("UTF-8")
      html_score.split(//).map{|ind_score| ind_score == "★" ? 2 : 1 }.inject{|sum,x| sum + x }
    end

  end
end