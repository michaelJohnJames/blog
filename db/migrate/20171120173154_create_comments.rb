class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :post_id
      t.belongs_to :user
      t.belongs_to :post
      t.timestamps
    end
  end
end
