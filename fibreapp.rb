require 'sinatra'
require 'rdiscount'
require 'erb'

require 'icalendar'
require 'date'
require 'open-uri'


configure do
  set :markdown, :layout_engine => :erb
end

@desktopAgents = /WebKit|Gecko|MSIE|Opera/
error RuntimeError do
  "Some kind of error occured, probbaly copied the link wrong. <a href='/'>Try again!</a>"
end

helpers do
  # Get the feed from Facebook and return the first calendar, which should be the birthday one
  def get_iCal(uid, key)
    calendars = Icalendar.parse(open("http://www.facebook.com/ical/b.php?uid=#{uid}&key=#{key}"))
    calendars.first
  end
  
  # Fix the event dates and then return the calendar
  def fix_iCal(calendar)
    calendar.events.each do |event|
      event.dtstart = Date.parse(event.dtstart.to_s) << 12
    end
    calendar
  end
  
  # Do all the work, send it out as a text/calendar or ics file
  def push_iCal(calendar)
    calendar = fix_iCal(calendar)
    content_type 'text/calendar'
    attachment('birthdays.ics')
    calendar.to_ical
  end
end

get '/' do
  @title = "FIBRE App - Because Facebook fails"
  markdown :index
end

# Just let the user paste it into a box and it'll redirect for them
post '/form' do
  redirect "/#{params[:url]}"  
end

get '/b/:uid/:key', :agent => @desktopAgents do
  calendar = get_iCal(params[:uid], params[:key])
  @feedurl = "#{request.host}/b/#{params[:uid]}/#{params[:key]}"
  erb :copy
end

# Export to application
get '/b/:uid/:key' do
  calendar = get_iCal(params[:uid], params[:key])
  push_iCal(calendar)
end

# If they are looking at this via a browser, tell them it worked and
# to copy the resultant URL to their client.
get '/webcal://www.facebook.com/ical/b.php', :agent => @desktopAgents do
  uid = params['uid']
  key = params['key']

  calendar = get_iCal(uid, key)
  @feedurl = "#{request.host}/b/#{uid}/#{key}"
  erb :copy

end

# Export to application, not prefered handler, but it does work
get '/webcal://www.facebook.com/ical/b.php' do
  uid = params['uid']
  key = params['key']
  
  calendar = get_iCal(uid, key)
  push_iCal(calendar)
end
