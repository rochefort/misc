# -*- coding: utf-8 -*-
require 'base64'
class BasicAuth
  def initialize(app, username, password)
    @app = app
    @username = username
    @password = password
  end

  def call(env)
    if auth_header = env["HTTP_AUTHORIZATION"]
      credentials = auth_header.scan(/Basic (.+)/).flatten.first
      username, password = Base64.decode64(credentials).split(":", 2)
      # p username
      # p password
      if username == @username && password == @password
        return @app.call(env)
      end
    end
    return request_credentials
  end

  private
  def request_credentials
    [
      401,
      {"WWW-Authenticate" => %Q(Basic realm="INPUT CREDENTIALS")},
      ["Authentication failed!"]
    ]
  end
end
