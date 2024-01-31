class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]

# Handles oauth response from provider and sets user attributes. 
  def self.from_google(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fullname = auth.info.name 
      user.avatar_url = auth.info.image
      user.save!
    end
  end
end


