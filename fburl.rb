require 'sinatra'

get '/' do
  'hello world!'
end

get '/webcal://www.facebook.com/ical/b.php' do
  uid = params['uid']
  key = params['key']
  
  "UID #{uid}  KEY #{key}"
end
