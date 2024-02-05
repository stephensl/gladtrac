class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.date :cohort_start
      t.text :about_me

      t.timestamps
    end
  end
end
