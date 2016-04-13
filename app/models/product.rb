class Product < ActiveRecord::Base
    has_many :reviews
    has_attached_file :image, styles: { medium: "500x500>", thumb: "150x150>" }, default_url: "/images/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
