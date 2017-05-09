class User < ApplicationRecord
  validates :uid, :username, :name, :email, :image_url, presence: true

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.username           = auth_info.extra.raw_info.login
      new_user.name               = auth_info.extra.raw_info.name
      new_user.email              = auth_info.extra.raw_info.email
      new_user.image_url          = auth_info.extra.raw_info.avatar_url
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

end
