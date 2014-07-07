App = lambda do |env|
  [200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end

run App
