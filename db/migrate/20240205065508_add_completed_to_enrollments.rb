class AddCompletedToEnrollments < ActiveRecord::Migration[7.1]
  def change
    add_column :enrollments, :completed, :boolean
  end
end
