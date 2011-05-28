require 'sinatra'
require 'ri_cal'
require 'date'
require 'open-uri'

get '/' do
  'hello world!'
end

get '/webcal://www.facebook.com/ical/b.php' do
  uid = params['uid']
  key = params['key']
  
  "UID #{uid}  KEY #{key}"
  
  calendars = RiCal.parse(open("http://www.facebook.com/ical/b.php?uid=#{uid}&key=#{key}"))

  calendars.first.events.each do |event|
    event.dtstart = Date.parse(event.dtstart.to_s) << 12
  end
  calendars.first.export
end
