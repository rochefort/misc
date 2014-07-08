require 'rails/railtie'
require 'simple_auth_plugin'

module SimpeAuthPlugin
  class Railtie < ::Rails::Railtie
    config.simple_auth = ActiveSupport::OrderOptions.new
    config.eager_load_namespaces << SimpleAuthPlugin

    initializer 'simple_auth.controller_ext' do
      puts 'SimpleAuthPlugin is loaded!'
      require 'simple_auth_plugin/authable'
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send :include, Authable
      end
    end

    initializer 'simple_auth.set_config' do
      config.simple_auth.user_class ||= User
      config.simple_auth.session_key ||= :id
    end

    generators do
      require 'simple_auth_plugin/generators'
    end

    rake_tasks do
      load 'tasks/simple_auth_plugin_tasks.rake'
    end
  end
end
