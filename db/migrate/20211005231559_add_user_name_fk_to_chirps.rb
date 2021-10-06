class AddUserNameFkToChirps < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :users, :chirps, column: :name
  end
end
