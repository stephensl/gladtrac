class RemoveStudentsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :students if table_exists?(:students)
  end
end
