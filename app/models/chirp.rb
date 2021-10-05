class Chirp < ApplicationRecord
    belongs_to :user

    # Active Record automatically defines model attributes for every table column, so you don't have to declare those attributes in your model file
    validates :content, presence: true
    validates :location, presence: true
end

# A model is a Ruby class that is used to represent data
# Models can interact with the app's database through a feature of Rails called Active Record
