class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_length_of :comment, :in => 7..20, :allow_blank => true
end
