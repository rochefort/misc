module SimpleAuthPlugin
  module Authable
    extend ActiveSupport::Concern
    class SignInRequired < StandardError; end

    included do
      helper_method :current_user
    end

    def auth_session_key
      Rails.application.config.simple_auth.session_key
    end

    def current_user
      @current_user ||= Rails.application.config.simple_auth.user_class.find_by(id: session[auth_session_key])
    end

    def require_signed_in!
      current_user || raise(SignInRequired)
    end

    def sign_in!(user)
      @current_user = user
      session[auth_session_key] = user.id
    end

    def sign_out!
      @current_user = nil
      session[auth_session_key] = nil
    end

    module ClassMethods
      def sign_in_required!(options={})
        before_filter :require_signed_in!, options
      end
    end
  end
end
