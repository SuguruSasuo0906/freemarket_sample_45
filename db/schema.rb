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

ActiveRecord::Schema.define(version: 20190719004824) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "postal_code",   default: "", null: false
    t.string   "city",          default: "", null: false
    t.string   "block_number",  default: "", null: false
    t.string   "building_name"
    t.string   "name",          default: "", null: false
    t.string   "namekana",      default: "", null: false
    t.integer  "prefecture_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["prefecture_id"], name: "index_addresses_on_prefecture_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name"
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "creditcards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",    null: false
    t.integer "item_id"
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "item_solds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status", null: false
  end

  create_table "item_states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                    null: false
    t.text     "description",   limit: 65535,             null: false
    t.string   "feewho",                                  null: false
    t.string   "shipment_day",                            null: false
    t.string   "delivery",                                null: false
    t.string   "size"
    t.integer  "price",                                   null: false
    t.integer  "user_id"
    t.integer  "prefecture_id"
    t.integer  "category_id"
    t.integer  "item_sold_id",                default: 1
    t.integer  "item_state_id"
    t.integer  "brand_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "good_count",                  default: 0, null: false
    t.integer  "pricegtlt_id"
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["item_sold_id"], name: "index_items_on_item_sold_id", using: :btree
    t.index ["item_state_id"], name: "index_items_on_item_state_id", using: :btree
    t.index ["prefecture_id"], name: "index_items_on_prefecture_id", using: :btree
    t.index ["pricegtlt_id"], name: "index_items_on_pricegtlt_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.index ["item_id"], name: "index_likes_on_item_id", using: :btree
    t.index ["user_id", "item_id"], name: "index_likes_on_user_id_and_item_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "comment",    limit: 65535
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_messages_on_item_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "phonenumbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "number",            null: false
    t.string   "verification_code"
    t.boolean  "verified"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_phonenumbers_on_user_id", using: :btree
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
  end

  create_table "pricegtlts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "gtlt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "item_id"
    t.integer "seller_id", null: false
    t.integer "buyer_id",  null: false
    t.index ["item_id"], name: "index_trades_on_item_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                 default: "", null: false
    t.string   "namekana",                             default: "", null: false
    t.integer  "point"
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.text     "profile_comment",        limit: 65535
    t.string   "payment",                              default: "", null: false
    t.string   "transfer",                             default: "", null: false
    t.string   "nickname"
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.string   "provider"
    t.string   "uid"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "prefectures"
  add_foreign_key "addresses", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "item_solds"
  add_foreign_key "items", "item_states"
  add_foreign_key "items", "prefectures"
  add_foreign_key "items", "pricegtlts"
  add_foreign_key "items", "users"
  add_foreign_key "messages", "items"
  add_foreign_key "messages", "users"
  add_foreign_key "phonenumbers", "users"
  add_foreign_key "trades", "items"
end
