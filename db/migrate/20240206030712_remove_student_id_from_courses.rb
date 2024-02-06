class RemoveStudentIdFromCourses < ActiveRecord::Migration[7.1]
  def change
    remove_column :courses, :student_id, :bigint
  end
end
