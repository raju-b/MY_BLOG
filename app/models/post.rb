class Post < ApplicationRecord
	belongs_to :user
	has_many :votes
	has_many :comments
	has_many :images,dependent: :destroy 
	
	after_destroy :destroy_action

<<<<<<< 7006741b7943d6baf7f001431528024dafc04a6d
	private
	def destroy_action
		byebug
	
puts 'post deleted successfully!!!!!!!!'
	end
	 # has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "2000x200>" }
  #      validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] 
=======
	accept_nested_attributes_for :images 
>>>>>>> added nested attributes in post.rb
end
