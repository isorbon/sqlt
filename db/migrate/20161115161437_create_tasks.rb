class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :ask
      t.text :answer
      t.integer :cat_id
      t.integer :mark
      t.integer :user_id
      t.integer :time
      t.timestamps
    end
  end
end
