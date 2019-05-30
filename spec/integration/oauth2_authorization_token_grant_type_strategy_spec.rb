require 'spec_helper'

describe Devise::Strategies::Oauth2AuthorizationCodeGrantTypeStrategy do
  describe 'POST /oauth2/token' do
    describe 'with grant_type=authorization_code' do
      context 'with valid params' do
        let(:user) { FactoryGirl.create :user }
        let(:client) { FactoryGirl.create :client }
        before do
          @authorization_code = user.authorization_codes.create!(:client => client)
          params = {
            :grant_type => 'authorization_code',
            :client_id => client.identifier,
            :client_secret => client.secret,
            :code => @authorization_code.token
          }

          post '/oauth2/token', params: params
        end
        it { response.code.to_i.should == 200 }
        it { response.content_type.should == 'application/json' }
        it 'returns json' do
          token = Devise::Oauth2Providable::AccessToken.last
          refresh_token = Devise::Oauth2Providable::RefreshToken.last
          expected = {
            :token_type => 'bearer',
            :expires_in => 899,
            :refresh_token => refresh_token.token,
            :scope => client.scopes,
            :user_id => user.id,
            :access_token => token.token
          }
          response.body.should match_json(expected)
        end
      end
      context 'with expired authorization_code' do
        let(:user) { FactoryGirl.create :user }
        let(:client) { FactoryGirl.create :client }
        before do
          timenow = 2.days.from_now
          Time.should_receive(:now).and_return(timenow)
          allow(Time).to receive(:now).and_return(timenow)
          @authorization_code = user.authorization_codes.create(:client => client)
          params = {
            :grant_type => 'authorization_code',
            :client_id => client.identifier,
            :client_secret => client.secret,
            :code => @authorization_code.token
          }
          allow(Time).to receive(:now).and_return(timenow + 10.minutes)

          post '/oauth2/token', params: params, headers: { accept: 'application/json' }
        end
        it { response.code.to_i.should == 400 }
        it { response.content_type.should == 'application/json' }
        it 'returns json' do
          expected = {
            :error => 'invalid_grant',
            :error_description => 'Invalid authorization code.'
          }
          response.body.should match_json(expected)
        end
      end
      context 'with invalid authorization_code' do
        let(:user) { FactoryGirl.create :user }
        let(:client) { FactoryGirl.create :client }
        before do
          @authorization_code = user.authorization_codes.create(:client => client)
          params = {
            :grant_type => 'authorization_code',
            :client_id => client.identifier,
            :client_secret => client.secret,
            :code => 'invalid'
          }

          post '/oauth2/token', params: params
        end
        it { response.code.to_i.should == 400 }
        it { response.content_type.should == 'application/json' }
        it 'returns json' do
          expected = {
            :error => 'invalid_grant',
            :error_description => 'Invalid authorization code.'
          }
          response.body.should match_json(expected)
        end
      end
      context 'with invalid client_secret' do
        let(:user) { FactoryGirl.create :user }
        let(:client) { FactoryGirl.create :client }
        before do
          @authorization_code = user.authorization_codes.create(:client => client)
          params = {
            :grant_type => 'authorization_code',
            :client_id => client.identifier,
            :client_secret => 'invalid',
            :scope => client.scopes,
            :user_id => user.id,
            :code => @authorization_code.token
          }

          post '/oauth2/token', params: params
        end
        it { response.code.to_i.should == 400 }
        it { response.content_type.should == 'application/json' }
        it 'returns json' do
          expected = {
            :error => 'invalid_client',
            :error_description => 'Invalid client credentials.'
          }
          response.body.should match_json(expected)
        end
      end
      context 'with invalid client_id' do
        let(:user) { FactoryGirl.create :user }
        let(:client) { FactoryGirl.create :client }
        before do
          @authorization_code = user.authorization_codes.create(:client => client)
          params = {
            :grant_type => 'authorization_code',
            :client_id => 'invalid',
            :client_secret => client.secret,
            :scope => client.scopes,
            :user_id => user.id,
            :code => @authorization_code.token
          }

          post '/oauth2/token', params: params
        end
        it { response.code.to_i.should == 400 }
        it { response.content_type.should == 'application/json' }
        it 'returns json' do
          expected = {
            :error => 'invalid_client',
            :error_description => 'Invalid client credentials.'
          }
          response.body.should match_json(expected)
        end
      end
    end
  end
end

