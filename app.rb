require 'sinatra'

post '/' do
  params = JSON.parse(request.body.read)

  event = params["webhook_metadata"]["event"]["include"]
  status = params["data"]["status"]
  
  command = "osascript -e 'display notification \"#{[event, status].join(' ')}\" with title \"Heroku\"'"
  `#{command}`
  status 204
end
