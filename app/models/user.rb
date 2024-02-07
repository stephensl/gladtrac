class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  has_one :school_credential

  # Define roles 
  enum role: [ unassigned: 0, student: 1, admin: 2]

  def self.from_google(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fullname = auth.info.name 
      user.avatar_url = auth.info.image
      user.save!
    end
  end

  def assign_role_from_school_credential
    credential = SchoolCredential.find_by(school_id: self.school_id)
    if credential
      self.update(role: credential.role)
    else
      errors.add(:base, "We were not able to find you in our database. Review input and try again.")
    end
  end
end 
