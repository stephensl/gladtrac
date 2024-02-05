class DropUnnecessaryTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :academic_plans, if_exists: true 
    remove_foreign_key :academic_plans, :students, if_exists: true
  end
end
