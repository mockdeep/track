# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130116185212) do

  create_table "items", :force => true do |t|
    t.integer  "user_id",                                         :null => false
    t.string   "name",                                            :null => false
    t.decimal  "lifetime_average", :precision => 15, :scale => 2
    t.decimal  "year_average",     :precision => 15, :scale => 2
    t.decimal  "month_average",    :precision => 15, :scale => 2
    t.decimal  "week_average",     :precision => 15, :scale => 2
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "items", ["created_at"], :name => "index_items_on_created_at"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "traces", :force => true do |t|
    t.integer  "item_id",     :null => false
    t.datetime "executed_on", :null => false
    t.integer  "count",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "traces", ["executed_on"], :name => "index_traces_on_executed_on"
  add_index "traces", ["item_id"], :name => "index_traces_on_item_id"

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
