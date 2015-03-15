# Scraperd

Scraperd is a very simple scraper for the public user activity RSS in [Letterboxd](http://letterboxd.com). It relies on OpenStruct to build objects.


## Installation

To get the latest stable:

    gem 'scraperd'

To get the latest code:

    gem 'scraperd', git: https://github.com/eltercero/scraperd

And then execute:

    $ bundle

## Usage

```ruby
>> require 'scraperd'

>> client = Scraperd::Base.new

# Example
#####################################################
# Return the RSS for an username
>> activities = client.fetch('eltercero')
=> [#<Scraperd::Activity ...]
>> film = activities.first
=> #<Scraperd::Activity title="Porco Rosso, 1992", score=8, link="http://letterboxd.com/eltercero/film/porco-rosso/", film_link="http://letterboxd.com/film/porco-rosso/", watched_at=2015-03-13 00:00:00 +0100, added_at=2015-03-13 22:52:18 +0100, original_response=#<Hashie::Mash dc_creator="V\xC3\xADctor" description="<p><img src=\"http://zardoz.cf.letterboxd.com/resized/film-poster/4/5/1/3/0/45130-porco-rosso-0-150-0-222-crop.jpg\"/></p> <p>Watched on Friday March 13, 2015.</p>" guid="letterboxd-watch-7901161" link="http://letterboxd.com/eltercero/film/porco-rosso/" pubDate=2015-03-13 22:52:18 +0100 title="Porco Rosso, 1992 - \xE2\x98\x85\xE2\x98\x85\xE2\x98\x85\xE2\x98\x85">>
>> film.title
=> "Porco Rosso, 1992"
>> film.score
=> 8
>> film.watched_at
=> 2015-03-13 00:00:00 +0100
```

## Contributing

Please, be my guest!

1. Fork it ( http://github.com/eltercero/scraperd/fork )
2. Create your feature branch (`git checkout -b sequels-can-be-good`). Don't forget to test your changes!
3. Commit your changes (`git commit -am 'Remember Godfather 2!'`)
4. Push to the branch (`git push origin sequels-can-be-good`)
5. Create new Pull Request

## License

Released under the [MIT License](http://opensource.org/licenses/MIT).
