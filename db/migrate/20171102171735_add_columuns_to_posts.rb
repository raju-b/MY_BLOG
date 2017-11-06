class AddColumunsToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :like, :integer, default: 0
  	add_column :posts, :dis_like, :integer, default: 0
  end
end
