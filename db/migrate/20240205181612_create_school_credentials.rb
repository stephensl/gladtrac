class CreateSchoolCredentials < ActiveRecord::Migration[7.1]
  def change
    create_table :school_credentials do |t|
      t.string :school_id
      t.string :school_email
      t.string :role
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
