class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.text :name
      t.text :description
      t.string :password
      t.datetime :start_t
        t.timestamps
    end
  end
end
