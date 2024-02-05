class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  has_one :school_credential

  # Define roles 
  enum role: [:student, :admin]
  
  after_create :assign_role_from_school_credential

def self.from_google(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.fullname = auth.info.name 
    user.avatar_url = auth.info.image
    # Move the role assignment logic here from after_create
    user.assign_role_from_school_credential
    user.save!
  end
end

  



def assign_role_from_school_credential(school_id)
  credential = SchoolCredential.find_by_school_id_and_email(school_id, self.email)
  if credential
    self.update(role: credential.role)
  else
    self.update(role: :student)
  end
end

end

