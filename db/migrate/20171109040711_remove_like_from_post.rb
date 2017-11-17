class RemoveLikeFromPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :like, :integer
  end
end
