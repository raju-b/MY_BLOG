class AddCommentsToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :comments, :string
    add_reference :comments, :post, foreign_key: true
  end
end
