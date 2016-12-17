class CreateUses < ActiveRecord::Migration[5.0]
  def change
    create_table :uses do |t|
      t.text :db_base
      t.text :db_shadow
      t.timestamps
    end
  end
end
