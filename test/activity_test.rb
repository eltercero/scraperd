require 'test_helper'

class ActivityTest < MiniTest::Test
  def test_activity_conversion
    item = {  :title => "Nausica\xC3\xA4 of the Valley of the Wind, 1984 - \xE2\x98\x85\xE2\x98\x85\xE2\x98\x85\xC2\xBD", 
              :link => "http://letterboxd.com/eltercero/film/nausicaa-of-the-valley-of-the-wind/", 
              :description => "<p><img src=\"http://primer.cf.letterboxd.com/resized/film-poster/5/1/9/6/9/51969-nausicaa-of-the-valley-of-the-wind-0-150-0-222-crop.jpg\"/></p> <p>Watched on Saturday March 14, 2015.</p>", 
              :pubDate => Time.new('2015-03-14 19:45:50 +0100'), 
              :guid => "letterboxd-watch-7911516", 
              :dc_creator => "V\xC3\xADctor"}

    activity = Scraperd::Activity.new(item)

    assert_equal activity.title, "Nausica\xC3\xA4 of the Valley of the Wind"
    assert_equal activity.year, "1984"
    assert_equal activity.score, 7
    assert_equal activity.link, "http://letterboxd.com/eltercero/film/nausicaa-of-the-valley-of-the-wind/"
    assert_equal activity.film_link, "http://letterboxd.com/film/nausicaa-of-the-valley-of-the-wind/"
    assert_equal activity.watched_at, Time.parse("Saturday March 14, 2015.")
    assert_equal activity.added_at, Time.new('2015-03-14 19:45:50 +0100')
    assert_equal activity.id, "letterboxd-watch-7911516"
  end
end
