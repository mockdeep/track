class CreateTraces < ActiveRecord::Migration
  def change
    create_table :traces do |t|
      t.references :item, :null => false
      t.datetime :executed_on, :null => false
      t.integer :count, :null => false

      t.timestamps
    end

    add_index :traces, :executed_on
  end
end
