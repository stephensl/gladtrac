class AddSchoolIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :school_id, :string
  end
end
