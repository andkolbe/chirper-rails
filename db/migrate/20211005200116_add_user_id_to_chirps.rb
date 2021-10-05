class AddUserIdToChirps < ActiveRecord::Migration[6.1]
  def change
    add_column :chirps, :user_id, :integer
    add_index :chirps, :user_id
  end
end
