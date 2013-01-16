class AddIndexes < ActiveRecord::Migration
  def change
    add_index :items, :user_id
    add_index :items, :created_at
    add_index :traces, :item_id
  end
end
