require 'spec_helper'

describe Devise::Strategies::Oauth2RefreshTokenGrantTypeStrategy do
  describe 'POST /oauth2/token' do
    describe 'with grant_type=refresh_token' do
      context 'with valid params' do
        let(:user) { create :user }
        let(:client) { create :client }
        before do
          @refresh_token = client.refresh_tokens.create! :user => user
          params = {
            :grant_type => 'refresh_token',
            :client_id => client.identifier,
            :client_secret => client.secret,
            :refresh_token => @refresh_token.token
          }

          post '/oauth2/token', params: params
        end
        it { response.code.to_i.should == 200 }
        it { response.content_type.should == 'application/json' }
        it 'returns json' do
          token = Devise::Oauth2Providable::AccessToken.last
          refresh_token = @refresh_token
          expected = {
            :token_type => 'bearer',
            :expires_in => 899,
            :refresh_token => token.refresh_token.token,
            :scope => client.scopes,
            :user_id => user.id,
            :access_token => token.token
          }
          response.body.should match_json(expected)
        end
      end
      context 'with expired refresh_token' do
        let(:user) { create :user }
        let(:client) { create :client }
        before do
          timenow = 2.days.from_now
          allow(Time).to receive(:now).and_return(timenow)
          @refresh_token = client.refresh_tokens.create! :user => user
          params = {
            :grant_type => 'refresh_token',
            :client_id => client.identifier,
            :client_secret => client.secret,
            :refresh_token => @refresh_token.token
          }
          allow(Time).to receive(:now).and_return(timenow + 2.months)

          post '/oauth2/token', params: params
        end
        it { response.code.to_i.should == 400 }
        it { response.content_type.should == 'application/json' }
        it 'returns json' do
          expected = {
            :error => 'invalid_grant',
            :error_description => 'Invalid refresh token.'
          }
          response.body.should match_json(expected)
        end
      end
      context 'with invalid refresh_token' do
        let(:user) { create :user }
        let(:client) { create :client }
        before do
          @refresh_token = client.refresh_tokens.create! :user => user
          params = {
            :grant_type => 'refresh_token',
            :client_id => client.identifier,
            :client_secret => client.secret,
            :refresh_token => 'invalid'
          }

          post '/oauth2/token', params: params
        end
        it { response.code.to_i.should == 400 }
        it { response.content_type.should == 'application/json' }
        it 'returns json' do
          token = Devise::Oauth2Providable::AccessToken.last
          refresh_token = @refresh_token
          expected = {
            :error => 'invalid_grant',
            :error_description => 'Invalid refresh token.'
          }
          response.body.should match_json(expected)
        end
      end
      context 'with invalid client_id' do
        let(:user) { create :user }
        let(:client) { create :client }
        before do
          @refresh_token = client.refresh_tokens.create! :user => user
          params = {
            :grant_type => 'refresh_token',
            :client_id => 'invalid',
            :client_secret => client.secret,
            :refresh_token => @refresh_token.token
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
      context 'with invalid client_secret' do
        let(:user) { create :user }
        let(:client) { create :client }
        before do
          @refresh_token = client.refresh_tokens.create! :user => user
          params = {
            :grant_type => 'refresh_token',
            :client_id => client.identifier,
            :client_secret => 'invalid',
            :refresh_token => @refresh_token.token
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

