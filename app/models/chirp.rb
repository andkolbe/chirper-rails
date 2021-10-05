class Chirp < ApplicationRecord
    # Active Record automatically defines model attributes for every table column, so you don't have to declare those attributes in your model file
    validates :content, presence: true
    validates :location, presence: true
end
