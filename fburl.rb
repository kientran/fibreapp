require 'sinatra'
require 'icalendar'
require 'date'
require 'open-uri'
require 'haml'

get '/' do
  haml :index
end

get '/webcal://www.facebook.com/ical/b.php' do
  uid = params['uid']
  key = params['key']
  
  "UID #{uid}  KEY #{key}"
  
  calendars = Icalendar.parse(open("http://www.facebook.com/ical/b.php?uid=#{uid}&key=#{key}"))

  calendars.first.events.each do |event|
    event.dtstart = Date.parse(event.dtstart.to_s) << 12
  end
  calendars.first.to_ical
end
