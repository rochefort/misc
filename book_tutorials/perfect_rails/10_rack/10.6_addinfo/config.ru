class AddInfo
  def initialize(app)
    @app = app
  end

  def call(env)
    code, headers, body = @app.call(env)
    body.first.prepend "Path info is: #{env['PATH_INFO']}<br />"
    body.first.prepend "Accessed from: #{env['REMOTE_ADDR']}<br />"
    return [code, headers, body]
  end
end

App = lambda do |env|
  [200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end

use AddInfo
run App
