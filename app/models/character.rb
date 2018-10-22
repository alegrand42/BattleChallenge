class Character < ApplicationRecord
    has_many :inventories
    has_many :weapons, through: :inventories
    include SharedSearchMethods
    has_attached_file :avatar, styles: { thumb: "120x120>" }, default_url: "/images/:style/missing.jpg"
    validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/gif", "image/png"], size: { in: 0..10.kilobytes }
end
