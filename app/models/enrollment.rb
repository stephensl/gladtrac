class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :grade, presence: true, if: :completed?
  validates :credits, numericality: { greater_than: 0 }, if: :completed?

  before_update :prevent_completion_without_grade_and_credits

  private

  def prevent_completion_without_grade_and_credits
    if completion_invalid?
      errors.add(:base, "Cannot mark as completed without a grade and positive credits.")
      throw(:abort)
    end
  end

  def completion_invalid?
    completed_changed? && completed? && (grade.blank? || credits.blank? || credits <= 0)
  end
end

