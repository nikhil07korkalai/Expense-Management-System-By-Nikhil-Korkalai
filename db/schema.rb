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

ActiveRecord::Schema.define(version: 20151212125243) do

  create_table "expense_categories", force: :cascade do |t|
    t.string   "expense_source", limit: 255
    t.string   "desc",           limit: 255
    t.integer  "user_reference", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "user_reference", limit: 4
    t.integer  "category",       limit: 4
    t.float    "amount",         limit: 24
    t.date     "date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "income_categories", force: :cascade do |t|
    t.string   "income_source",  limit: 255
    t.string   "desc",           limit: 255
    t.integer  "user_reference", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.integer  "user_reference", limit: 4
    t.integer  "category",       limit: 4
    t.float    "amount",         limit: 24
    t.date     "date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "transaction_through_type", limit: 255
    t.integer  "transaction_through_id",   limit: 4
    t.integer  "user_reference",           limit: 4
    t.date     "date"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "user_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "email",             limit: 255
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
