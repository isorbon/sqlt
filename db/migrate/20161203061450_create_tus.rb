class CreateTus < ActiveRecord::Migration[5.0]
  def change
    create_table :tus do |t|
      t.integer :test_id
      t.integer :user_id
      t.integer :mark
      t.integer :option
      t.boolean :onload
      t.timestamps
    end
  end
end
