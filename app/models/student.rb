class Student < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :academic_plans
  has_one :grad_profile
end
