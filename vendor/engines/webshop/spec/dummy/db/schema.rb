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

ActiveRecord::Schema.define(version: 20160109092613) do

  create_table "conratewebshop_carts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conratewebshop_categories", force: :cascade do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth",          default: 0, null: false
    t.integer "children_count", default: 0, null: false
  end

  add_index "conratewebshop_categories", ["depth"], name: "index_conratewebshop_categories_on_depth"
  add_index "conratewebshop_categories", ["lft"], name: "index_conratewebshop_categories_on_lft"
  add_index "conratewebshop_categories", ["parent_id"], name: "index_conratewebshop_categories_on_parent_id"
  add_index "conratewebshop_categories", ["rgt"], name: "index_conratewebshop_categories_on_rgt"

  create_table "conratewebshop_line_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "cart_id"
    t.integer "quantity",   default: 1
  end

  create_table "conratewebshop_orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.string   "pay_type"
    t.string   "delivery_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conratewebshop_products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
