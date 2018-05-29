class Post < ApplicationRecord
	belongs_to :user
	has_many :votes
	has_many :comments
	has_many :images,dependent: :destroy 
	after_destroy :destroy_action
	accepts_nested_attributes_for :images 
end
