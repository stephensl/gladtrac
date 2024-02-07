class SchoolCredential < ApplicationRecord
  belongs_to :user, optional: true # to allow create credentials before a user

  validates :school_id, presence: true, uniqueness: { message: "This school ID is already taken" }
  validates :school_email, presence: true, uniqueness: { message: "This school email is already taken" }
  validates :role, inclusion: { in: %w[student admin], message: "Role must be 'student' or 'admin'" }
  
  # Find a credential by school_id and verify the email
  def self.find_by_school_id(school_id)
    find_by(school_id: school_id)
  end
end
