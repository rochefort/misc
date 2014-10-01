require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'hello world'
end

get '/about' do
  'about this is page 2'
end
