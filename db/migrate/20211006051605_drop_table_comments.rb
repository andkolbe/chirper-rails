class DropTableComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :chirp_id, :integer
    remove_column :comments, :chirps_id, :integer
    
  end
end
