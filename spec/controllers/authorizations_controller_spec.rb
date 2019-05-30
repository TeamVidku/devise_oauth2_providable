require 'spec_helper'

describe Devise::Oauth2Providable::AuthorizationsController do
  routes { Devise::Oauth2Providable::Engine.routes }
  describe 'GET #new' do
    context 'with valid redirect_uri' do
      let(:user) { create :user }
      let(:client) { create :client }
      let(:redirect_uri) { client.redirect_uri }
      before do
        sign_in user
        get :new, params: {:client_id => client.identifier, :redirect_uri => redirect_uri, response_type: 'code' }
      end
      it { should respond_with :success }
      it { response.content_type.should eq 'text/html' }
      it { should assign_to(:redirect_uri).with(redirect_uri) }
      it { should assign_to(:response_type) }
      it { should render_template 'devise/oauth2_providable/authorizations/new' }
    end
    context 'with invalid redirect_uri' do
      let(:user) { create :user }
      let(:client) { create :client }
      let(:redirect_uri) { 'http://example.com/foo/bar' }
      before do
        sign_in user
        get :new, params: { :client_id => client.identifier, :redirect_uri => redirect_uri, response_type: 'code' }
      end
      it { should respond_with :bad_request }
      it { response.content_type.should eq 'text/html' }
    end
  end
end
