class Image < ApplicationRecord
  

  belongs_to :post

   has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }
       validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :image, presence: true 
 
end
