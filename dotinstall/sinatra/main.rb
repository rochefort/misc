require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @title = 'main index'
  @content = 'main content'
  erb :index
end

get '/about' do
  @title = 'about this page'
  @content = 'about content'
  @email = 'taguchi@gmail.com'
  erb :about
end
