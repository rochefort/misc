require 'sinatra'
require 'sinatra/reloader'

# get '/hello/:name' do
#   "hello #{params[:name]}"
# end

# get '/hello/:name' do |n|
#   "hello #{n}"
# end

get '/hello/:fname/?:lname?' do |f, l|
  "hello #{f} #{l}"
end
