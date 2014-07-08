Rails.application.routes.draw do
  get '/status/revision' => 'status#revision'
  get '/status/dstat'    => 'status#dstat'
end
