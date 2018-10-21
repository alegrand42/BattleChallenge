class Weapon < ApplicationRecord
    has_many :inventories
    has_many :characters, through: :inventories
    include SharedSearchMethods
end
