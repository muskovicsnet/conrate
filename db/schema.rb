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

ActiveRecord::Schema.define(version: 20160204210240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "conrateaddressable_addresses", force: :cascade do |t|
    t.string   "addresstype"
    t.string   "country"
    t.string   "city"
    t.string   "zip"
    t.string   "publicplace"
    t.string   "publicplace_type"
    t.string   "number"
    t.string   "other"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conrateaddressable_addresses", ["addresstype"], name: "index_conrateaddressable_addresses_on_addresstype", using: :btree
  add_index "conrateaddressable_addresses", ["user_id"], name: "index_conrateaddressable_addresses_on_user_id", using: :btree

  create_table "conrateblogs_blogs", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "conrateblogs_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "blog_id"
    t.boolean  "socials",    default: false
    t.boolean  "comments",   default: false
    t.datetime "startdate"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "conrategalleries_galleries", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "socials",     default: false
  end

  create_table "conrategalleries_photos", force: :cascade do |t|
    t.string   "title"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
    t.string   "photo"
    t.string   "image"
    t.integer  "ordernum"
  end

  create_table "conratemenus_menuabletypes", force: :cascade do |t|
    t.string   "classname"
    t.string   "getelementspath"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conratemenus_menuabletypes", ["classname"], name: "index_conratemenus_menuabletypes_on_classname", using: :btree

  create_table "conratemenus_menus", force: :cascade do |t|
    t.string  "title"
    t.integer "menuable_id"
    t.string  "menuable_type"
    t.string  "module_path"
    t.boolean "translateable",  default: false
    t.boolean "editable",       default: false
    t.boolean "cantmove",       default: false
    t.string  "locale_id"
    t.integer "relposition",    default: 0
    t.string  "icon"
    t.string  "target"
    t.integer "parent_id"
    t.integer "lft",                            null: false
    t.integer "rgt",                            null: false
    t.integer "depth",          default: 0,     null: false
    t.integer "children_count", default: 0,     null: false
  end

  add_index "conratemenus_menus", ["lft"], name: "index_conratemenus_menus_on_lft", using: :btree
  add_index "conratemenus_menus", ["locale_id"], name: "index_conratemenus_menus_on_locale_id", using: :btree
  add_index "conratemenus_menus", ["menuable_id", "menuable_type"], name: "index_conratemenus_menus_on_menuable_id_and_menuable_type", using: :btree
  add_index "conratemenus_menus", ["parent_id"], name: "index_conratemenus_menus_on_parent_id", using: :btree
  add_index "conratemenus_menus", ["rgt"], name: "index_conratemenus_menus_on_rgt", using: :btree
  add_index "conratemenus_menus", ["title"], name: "index_conratemenus_menus_on_title", using: :btree

  create_table "conratemenus_urls", force: :cascade do |t|
    t.string   "href"
    t.boolean  "parseable",  default: false
    t.integer  "target",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conratepages_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conratesecurity_acls", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_type"
    t.integer  "role_id"
    t.string   "role_type"
    t.string   "access_type"
    t.integer  "aclable_id"
    t.string   "aclable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conratesecurity_acls", ["aclable_id", "aclable_type"], name: "index_conratesecurity_acls_on_aclable_id_and_aclable_type", using: :btree
  add_index "conratesecurity_acls", ["role_id", "access_type"], name: "index_conratesecurity_acls_on_role_id_and_access_type", using: :btree
  add_index "conratesecurity_acls", ["role_id"], name: "index_conratesecurity_acls_on_role_id", using: :btree
  add_index "conratesecurity_acls", ["user_id", "access_type"], name: "index_conratesecurity_acls_on_user_id_and_access_type", using: :btree
  add_index "conratesecurity_acls", ["user_id"], name: "index_conratesecurity_acls_on_user_id", using: :btree

  create_table "conratesecurity_identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "conratesecurity_identities", ["user_id"], name: "index_conratesecurity_identities_on_user_id", using: :btree

  create_table "conratesecurity_roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "role_type",     default: "USER"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conratesecurity_roles", ["name", "resource_type", "resource_id"], name: "index_conratesecurity_roles_on_name_resourcetype_resourceid", using: :btree
  add_index "conratesecurity_roles", ["name"], name: "index_conratesecurity_roles_on_name", using: :btree
  add_index "conratesecurity_roles", ["priority"], name: "index_conratesecurity_roles_on_priority", unique: true, using: :btree

  create_table "conratesecurity_users", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "deactivated",            default: false
    t.string   "firstname"
    t.string   "secondname"
    t.string   "thirdname"
    t.string   "mobile"
    t.boolean  "billingisdelivery",      default: true
  end

  add_index "conratesecurity_users", ["confirmation_token"], name: "index_conratesecurity_users_on_confirmation_token", unique: true, using: :btree
  add_index "conratesecurity_users", ["email"], name: "index_conratesecurity_users_on_email", unique: true, using: :btree
  add_index "conratesecurity_users", ["reset_password_token"], name: "index_conratesecurity_users_on_reset_password_token", unique: true, using: :btree
  add_index "conratesecurity_users", ["unlock_token"], name: "index_conratesecurity_users_on_unlock_token", unique: true, using: :btree
  add_index "conratesecurity_users", ["username"], name: "index_conratesecurity_users_on_username", unique: true, using: :btree

  create_table "conratesecurity_users_conratesecurity_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "conratesecurity_users_conratesecurity_roles", ["user_id", "role_id"], name: "index_conratesecurity_users_roles_user_role", using: :btree

  create_table "conratewebshop_carts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "conratewebshop_categories", force: :cascade do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth",          default: 0, null: false
    t.integer "children_count", default: 0, null: false
  end

  add_index "conratewebshop_categories", ["depth"], name: "index_conratewebshop_categories_on_depth", using: :btree
  add_index "conratewebshop_categories", ["lft"], name: "index_conratewebshop_categories_on_lft", using: :btree
  add_index "conratewebshop_categories", ["parent_id"], name: "index_conratewebshop_categories_on_parent_id", using: :btree
  add_index "conratewebshop_categories", ["rgt"], name: "index_conratewebshop_categories_on_rgt", using: :btree

  create_table "conratewebshop_conversions", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.decimal "quantity"
  end

  add_index "conratewebshop_conversions", ["from_id", "to_id"], name: "index_conratewebshop_conversions_on_from_id_and_to_id", using: :btree

  create_table "conratewebshop_line_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "cart_id"
    t.integer "quantity",   default: 1
    t.integer "order_id"
  end

  create_table "conratewebshop_orders", force: :cascade do |t|
    t.string   "email"
    t.string   "mobile"
    t.string   "pay_type"
    t.string   "delivery_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "success"
    t.boolean  "terms_of_service",    default: false
    t.string   "firstname"
    t.string   "secondname"
    t.string   "thirdname"
    t.string   "addresstype"
    t.string   "country"
    t.string   "city"
    t.string   "zip"
    t.string   "publicplace"
    t.string   "publicplace_type"
    t.string   "number"
    t.string   "other"
    t.integer  "delivery_address_id"
    t.integer  "billing_address_id"
    t.boolean  "billingisdelivery",   default: true
  end

  create_table "conratewebshop_pricemanipulators", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.text     "code"
    t.boolean  "perproduct", default: false
    t.boolean  "showifzero", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conratewebshop_pricemanipulators", ["perproduct"], name: "index_conratewebshop_pricemanipulators_on_perproduct", using: :btree
  add_index "conratewebshop_pricemanipulators", ["showifzero"], name: "index_conratewebshop_pricemanipulators_on_showifzero", using: :btree

  create_table "conratewebshop_products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "unitprice"
    t.integer  "unitprice_quantity_unit_id"
    t.decimal  "quantity"
    t.integer  "quantity_unit_id"
  end

  create_table "conratewebshop_quantity_units", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.boolean  "translateable", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: :cascade do |t|
    t.string   "key",                        null: false
    t.boolean  "enabled",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "kimitvisz_collections", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.boolean  "closed",      default: false
    t.datetime "thedate"
    t.string   "invitername"
  end

  add_index "kimitvisz_collections", ["token"], name: "index_kimitvisz_collections_on_token", using: :btree
  add_index "kimitvisz_collections", ["user_id"], name: "index_kimitvisz_collections_on_user_id", using: :btree

  create_table "kimitvisz_entities", force: :cascade do |t|
    t.string   "email"
    t.string   "token"
    t.integer  "collection_id"
    t.boolean  "emailsent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "kimitvisz_items", force: :cascade do |t|
    t.integer  "collection_id"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications_messages", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.integer  "parent_id"
    t.string   "messagetype"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "unread",         default: true
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "notifications_messages", ["messagetype"], name: "index_notifications_messages_on_messagetype", using: :btree
  add_index "notifications_messages", ["recipient_id", "recipient_type"], name: "index_notifications_messages_on_recipient_id_and_recipient_type", using: :btree
  add_index "notifications_messages", ["sender_id", "sender_type"], name: "index_notifications_messages_on_sender_id_and_sender_type", using: :btree

  create_table "pamer_actualvalues", force: :cascade do |t|
    t.string   "code"
    t.integer  "orderrow_id"
    t.integer  "value"
    t.datetime "expires"
    t.string   "description"
  end

  add_index "pamer_actualvalues", ["code"], name: "index_pamer_actualvalues_on_code", using: :btree

  create_table "pamer_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pamer_items", ["code"], name: "index_pamer_items_on_code", using: :btree

  create_table "pamer_items_packages", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.boolean  "optional",     default: true
    t.boolean  "repeatable"
    t.datetime "expires"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "expires_time"
    t.string   "expires_unit"
  end

  create_table "pamer_orderrows", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "count"
    t.string   "state"
    t.datetime "expires"
    t.integer  "repeat"
    t.string   "currency"
    t.integer  "orderable_id"
    t.string   "orderable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pamer_orderrows", ["orderable_type", "orderable_id"], name: "index_pamer_orderrows_on_orderable_type_and_orderable_id", using: :btree

  create_table "pamer_orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "trackingid"
  end

  create_table "pamer_packages", force: :cascade do |t|
    t.string   "name"
    t.boolean  "repeatable"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "changegroup"
    t.integer  "expires_time"
    t.string   "expires_unit"
  end

  create_table "pamer_prices", force: :cascade do |t|
    t.integer  "priceable_id"
    t.string   "priceable_type"
    t.integer  "pricetype"
    t.money    "price",          scale: 2
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "pamer_prices", ["priceable_type", "priceable_id"], name: "index_pamer_prices_on_priceable_type_and_priceable_id", using: :btree

  create_table "que_jobs", id: false, force: :cascade do |t|
    t.integer  "priority",    limit: 2, default: 100,                                        null: false
    t.datetime "run_at",                default: "now()",                                    null: false
    t.integer  "job_id",      limit: 8, default: "nextval('que_jobs_job_id_seq'::regclass)", null: false
    t.text     "job_class",                                                                  null: false
    t.json     "args",                  default: [],                                         null: false
    t.integer  "error_count",           default: 0,                                          null: false
    t.text     "last_error"
    t.text     "queue",                 default: "",                                         null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                                    null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type",  limit: 30
    t.string   "locale"
    t.boolean  "localizable",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var", "locale"], name: "index_settings_on_all", unique: true, using: :btree

end
