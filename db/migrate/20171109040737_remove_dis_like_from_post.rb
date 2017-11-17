class RemoveDisLikeFromPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :dis_like, :integer
  end
end
