class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.decimal :lifetime_average, precision: 15, scale: 2
      t.decimal :year_average, precision: 15, scale: 2
      t.decimal :month_average, precision: 15, scale: 2
      t.decimal :week_average, precision: 15, scale: 2

      t.timestamps
    end
  end
end
