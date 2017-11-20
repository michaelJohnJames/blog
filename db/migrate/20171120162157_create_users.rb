class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :location
      t.string :description
      t.string :f_name
      t.string :l_name

      t.timestamps
    end
  end
end
