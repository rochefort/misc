class StatusController < ApplicationController
  def revision
    revfile = Rails.root.join 'REVISION'
    if File.exist?(revfile)
      render text: File.read(revfile)
    else
      render text: `git rev-parse HEAD`
    end
  rescue
    render text: 'unknown'
  end

  def dstat
    render text: `dstat -cmsnt --nocolor 1 2`
  rescue
    render text: 'please install dstat'
  end
end
