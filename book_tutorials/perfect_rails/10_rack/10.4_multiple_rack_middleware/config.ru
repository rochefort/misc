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

class RackToRuby
  def initialize(app)
    @app = app
  end

  def call(env)
    code, headers, body = @app.call(env)
    body.each{ |part| part.gsub! /Rack/i, 'Ruby' }
    return [code, headers, body]
  end
end

App = lambda do |env|
  [200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end

use UpcaseAll
use RackToRuby
run App
