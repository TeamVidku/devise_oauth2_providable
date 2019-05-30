require 'spec_helper'

describe ProtectedController do

  describe 'get :index' do
    let(:user) { FactoryGirl.create :user }
    let(:client) { FactoryGirl.create :client }
    before do
      @token = Devise::Oauth2Providable::AccessToken.create! :client => client, :user => user
    end
    context 'with valid bearer token in header' do
      before do

        @request.env['HTTP_AUTHORIZATION'] = "Bearer #{@token.token}"
        get :index, :format => 'json'
      end
      it { should respond_with :success }
    end
    context 'with valid bearer token in query string' do
      before do
        get :index, params: { :access_token => @token.token, :format => 'json' }
      end
      it { should respond_with :success }
    end

    context 'with invalid bearer token in query param' do
      before do
        get :index, params: { :access_token => 'invalid', :format => 'json' }
      end
      it { should respond_with :unauthorized }
    end
    context 'with valid bearer token in header and query string' do
      before do
      end
      it 'raises error' do
        lambda {
          @request.env['HTTP_AUTHORIZATION'] = "Bearer #{@token.token}"
          get :index, params: { :access_token => @token.token, :format => 'json' }
        }.should raise_error Rack::OAuth2::Server::Resource::BadRequest
      end
    end
  end
end
