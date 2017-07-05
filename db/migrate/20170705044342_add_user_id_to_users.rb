class AddUserIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
<<<<<<< Updated upstream
=======
    add_column :users, :user_id, :integer
>>>>>>> Stashed changes
  end
end
