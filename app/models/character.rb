class Character < ApplicationRecord
    has_many :inventories
    has_many :weapons, through: :inventories
    include SharedSearchMethods
    has_attached_file :avatar, styles: { thumb: "120x120>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
