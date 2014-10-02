require 'sinatra'
require 'sinatra/reloader'

before '/admin/*' do
  @author = 'admin area!'
end

before do
  @author = 'taguchi'
end

after do
  logger.info 'page displayed successfully'
end

helpers do
  def strong(s)
    "<strong>#{s}</strong>"
  end
end

get '/' do
  @title = 'main index'
  @content = 'main content' + @author
  erb :index
end

get '/about' do
  @title = 'about this page'
  @content = 'this page is ... by ' + strong(@author)
  @email = 'taguchi@gmail.com'
  erb :about
end
