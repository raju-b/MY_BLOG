class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
