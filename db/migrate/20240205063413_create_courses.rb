class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.references :student, null: false, foreign_key: true
      t.string :name
      t.string :subject
      t.text :state_code
      t.text :local_code
      t.text :credit_type

      t.timestamps
    end
  end
end
