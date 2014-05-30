class TimerController < ApplicationController
  include ActionController::Live

  def tick
    response.headers['Content-Type'] = 'text/event-stream'

    begin
      seconds = 0
      loop do
        response.stream.write("data: #{seconds}\n\n")
        seconds += 1
        sleep 1
      end
    rescue IOError
      # client dsconnected
    ensure
      response.stream.close # cleanup
    end
  end
end
