class ChirpToChirps < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.references :chirps, null: false, foreign_key: true
    end  
  end
end
