namespace :simple_auth do
  namespace :generate do
    desc 'Generate a model for authrization'
    task :model do
      system "rails g model User name:string password:string"
    end
  end
end
