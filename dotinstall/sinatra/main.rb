require 'sinatra'
require 'sinatra/reloader'

=begin
get '/from/*/to/*' do |f, t|
  "hello #{f} #{t}"
end
=end

get %r{/users/([0-9]*)} do |i|
  "user id = #{i}"
end
