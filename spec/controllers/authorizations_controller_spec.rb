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
      end

      context 'with html request' do
        before do
          get :new, params: {:client_id => client.identifier, :redirect_uri => redirect_uri, response_type: 'code' }
        end
        it { should respond_with :success }
        it { response.content_type.should eq 'text/html' }
        it { should assign_to(:redirect_uri).with(redirect_uri) }
        it { should assign_to(:response_type) }
        it { should render_template 'devise/oauth2_providable/authorizations/new' }
      end

      context 'with json request' do
        let(:client) { create :client, scopes: 'read_only' }
        before do
          request.headers['Accept'] = 'application/json'
          get :new, params: {:client_id => client.identifier, :redirect_uri => redirect_uri, response_type: 'code' }
        end
        it { should respond_with :success }
        it { response.content_type.should eq 'application/json' }
        it 'matches json' do
          expected = {
            :name => client.name,
            :client_id => client.id,
            :scopes => client.scopes
          }
          response.body.should match_json(expected)
        end
      end
    end

    context 'with invalid redirect_uri' do
      let(:user) { create :user }
      let(:client) { create :client }
      let(:redirect_uri) { 'http://example.com/foo/bar' }

      before do
        sign_in user
      end
      context 'with html request' do
        before do
          get :new, params: { :client_id => client.identifier, :redirect_uri => redirect_uri, response_type: 'code' }
        end
        it { should respond_with :bad_request }
        it { response.content_type.should eq 'text/html' }
      end

      context 'with json request' do
        before do
          request.headers['Accept'] = 'application/json'
          get :new, params: { :client_id => client.identifier, :redirect_uri => redirect_uri, response_type: 'code' }
        end
        it { should respond_with :bad_request }
        it { response.content_type.should eq 'application/json' }
      end
    end
  end

  describe 'POST #create' do
    let(:user) { create :user }
    let(:client) { create :client }
    let(:redirect_uri) { client.redirect_uri }
    before do
      sign_in user
    end
    context 'when approves' do
      context 'with json request' do
        before do
          request.headers['Accept'] = 'application/json'
          post :create, params: { :client_id => client.identifier, :redirect_uri => redirect_uri, response_type: 'code', :approve => true }
        end
        it { should respond_with :success }
        it { response.content_type.should eq 'application/json' }
        it 'matches json' do
          authorization_code = Devise::Oauth2Providable::AuthorizationCode.last
          expected = {
            :client_id => client.id,
            :code => authorization_code.token
          }
          response.body.should match_json(expected)
        end
      end
    end

    context 'when does not approve' do
      context 'with json request' do
        before do
          request.headers['Accept'] = 'application/json'
          post :create, params: { :client_id => client.identifier, :redirect_uri => redirect_uri, response_type: 'code' }
        end
        it { should respond_with :ok }
        it { response.content_type.should eq 'application/json' }
        it 'matches json' do
          expected = {
            :name => client.name,
            :client_id => client.id,
            :scopes => client.scopes
          }
          response.body.should match_json(expected)
        end
      end
    end
  end
end
