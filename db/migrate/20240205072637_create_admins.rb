class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.references :user, null: false, foreign_key: true
      t.text :reports

      t.timestamps
    end
  end
end
