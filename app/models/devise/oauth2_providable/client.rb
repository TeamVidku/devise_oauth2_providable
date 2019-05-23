class Devise::Oauth2Providable::Client < ActiveRecord::Base
  has_many :access_tokens
  has_many :refresh_tokens
  has_many :authorization_codes

  before_validation :init_identifier, :on => :create, :unless => :identifier?
  before_validation :init_secret, :on => :create, :unless => :secret?
  validates :website, :secret, :presence => true
  validates :name, :presence => true, :uniqueness => true
  validates :identifier, :presence => true, :uniqueness => true

  def expire_tokens_for_user(user)
    access_tokens.where(user_id: user.id).where('expires_at > ?', Time.zone.now).update_all(expires_at: Time.zone.now)
    refresh_tokens.where(user_id: user.id).where('expires_at > ?', Time.zone.now).update_all(expires_at: Time.zone.now)
  end

  def has_scope?(scope)
    scopes.split(',').include?(scope.to_s)
  end

  private

  def init_identifier
    self.identifier = Devise::Oauth2Providable.random_id
  end

  def init_secret
    self.secret = Devise::Oauth2Providable.random_id
  end

end
