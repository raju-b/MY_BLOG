class Post < ApplicationRecord
	belongs_to :user
	has_many :votes
	has_many :comments
	has_many :images,dependent: :destroy 
	
	after_destroy :destroy_action
accept_nested_attributes_for :images

	 # has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "2000x200>" }
  #      validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] 
end
