class Devise::Oauth2Providable::TokensController < ApplicationController
  prepend_before_action :reset_session!
  prepend_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, :only => :create

  rescue_from Rack::OAuth2::Server::Authorize::BadRequest do |e|
    head :bad_request
  end

  def create
    @refresh_token = oauth2_current_client.refresh_tokens.create!(:user => current_user)
    @access_token = @refresh_token.access_tokens.create!(:client => oauth2_current_client, :user => current_user)
    yield if block_given?
    render :json => @access_token.token_response
  end

  def destroy
    raise Rack::OAuth2::Server::Authorize::BadRequest unless current_user && oauth2_current_client
    oauth2_current_client.expire_tokens_for_user(current_user)
    current_user.sign_out if current_user.respond_to?(:sign_out)
    yield if block_given?
    head :no_content
  end

  private

  def oauth2_current_client
   request.headers.env[Devise::Oauth2Providable::CLIENT_ENV_REF]
  end

  def oauth2_current_refresh_token
    request.headers.env[Devise::Oauth2Providable::REFRESH_TOKEN_ENV_REF]
  end

  def reset_session!
    request.reset_session
  end
end
