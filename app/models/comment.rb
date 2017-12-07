class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user

	post belongs to user  means assoaciation
end
