class UpcaseAll
  def initialize(app)
    @app = app
  end

  def call(env)
    code, headers, body = @app.call(env)
    body.each{ |part| part.upcase! }
    return [code, headers, body]
  end
end

App = lambda do |env|
  [200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end

use UpcaseAll
run App
