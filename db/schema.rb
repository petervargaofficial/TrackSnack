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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140508015550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: true do |t|
    t.string   "item_name"
    t.text     "item_description"
    t.float    "item_price"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_items", ["vendor_id"], name: "index_menu_items_on_vendor_id", using: :btree

  create_table "order_item_quantities", force: true do |t|
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "menu_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_item_quantities", ["menu_item_id"], name: "index_order_item_quantities_on_menu_item_id", using: :btree
  add_index "order_item_quantities", ["order_id"], name: "index_order_item_quantities_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmed"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
