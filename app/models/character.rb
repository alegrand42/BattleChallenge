class Character < ApplicationRecord
    has_many :inventories
    has_many :weapons, through: :inventories
    include SharedSearchMethods
end
