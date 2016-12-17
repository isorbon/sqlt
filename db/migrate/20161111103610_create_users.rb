class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :login
      t.string :password
      t.string :secret
      t.text :img
      t.integer :status_user
      t.timestamps
    end
  end
end
