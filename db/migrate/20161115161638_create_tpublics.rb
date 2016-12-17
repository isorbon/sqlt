class CreateTpublics < ActiveRecord::Migration[5.0]
  def change
    create_table :tpublics do |t|
      t.integer :task_id
      t.integer :test_id
      t.integer :option
      t.timestamps
    end
  end
end
