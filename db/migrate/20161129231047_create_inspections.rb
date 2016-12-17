class CreateInspections < ActiveRecord::Migration[5.0]
  def change
    create_table :inspections do |t|
      t.integer :task_id
      t.integer :user_id
      t.integer :test_id
      t.text :answer
      t.integer :mark
      t.timestamps
    end
  end
end
