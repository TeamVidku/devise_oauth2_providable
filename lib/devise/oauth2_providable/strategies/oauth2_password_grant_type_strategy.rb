require 'devise/oauth2_providable/strategies/oauth2_grant_type_strategy'

module Devise
  module Strategies
    class Oauth2PasswordGrantTypeStrategy < Oauth2GrantTypeStrategy
      def grant_type
        'password'
      end

      def authenticate_grant_type(client)
        keys = mapping.to.authentication_keys
        resource = mapping.to.find_for_database_authentication(keys.first => params[:username])
        if validate(resource) { resource.valid_password?(params[:password]) }
          success! resource
        else
          keys_string = keys.join(I18n.translate(:"support.array.words_connector"))
          message = resource ? resource.unauthenticated_message : :invalid
          oauth_error! :invalid_grant, I18n.t("devise.failure.#{resource.unauthenticated_message}", authentication_keys: keys_string)
        end
      end
    end
  end
end

Warden::Strategies.add(:oauth2_password_grantable, Devise::Strategies::Oauth2PasswordGrantTypeStrategy)
