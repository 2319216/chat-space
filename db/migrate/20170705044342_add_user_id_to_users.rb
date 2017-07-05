class AddUserIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :user_id, :integer
  end
end
