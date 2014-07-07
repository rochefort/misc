require './basic_auth'
# class Application < Rails::Application
#   config.middleware.use BasicAuth, "udura", "password"
# end
App = lambda do |env|
  [200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end

use BasicAuth, 'udzura', 'password'
run App
