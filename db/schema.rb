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

ActiveRecord::Schema.define(version: 20170421170045) do

  create_table "branches", force: :cascade do |t|
    t.string  "name",         limit: 255
    t.string  "description",  limit: 255
    t.string  "address",      limit: 255
    t.string  "phone_number", limit: 255
    t.integer "store_id",     limit: 4
    t.integer "user_id",      limit: 4
    t.float   "latitude",     limit: 24
    t.float   "longitude",    limit: 24
  end

  add_index "branches", ["store_id"], name: "index_branches_on_store_id", using: :btree
  add_index "branches", ["user_id"], name: "index_branches_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "products", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.string  "price",       limit: 255
    t.text    "details",     limit: 65535
    t.binary  "image",       limit: 16777215
    t.boolean "available",                    default: true
    t.integer "category_id", limit: 4
    t.integer "branch_id",   limit: 4
  end

  add_index "products", ["branch_id"], name: "index_products_on_branch_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string  "name",   limit: 255
    t.boolean "active",             default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "account_type",           limit: 255
    t.integer  "branch_id",              limit: 4
  end

  add_index "users", ["branch_id"], name: "index_users_on_branch_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "branches", "stores"
  add_foreign_key "branches", "users"
  add_foreign_key "products", "branches"
  add_foreign_key "products", "categories"
  add_foreign_key "users", "branches"
end
