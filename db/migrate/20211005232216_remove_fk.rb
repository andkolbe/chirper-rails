class RemoveFk < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :users, :chirps
  end
end
