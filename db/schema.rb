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

ActiveRecord::Schema.define(version: 20171011211540) do

  create_table "envelopes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "total",        precision: 8, scale: 2
    t.string   "name"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
    t.integer  "initialTotal"
    t.index ["user_id"], name: "fk_rails_8fd0551b06", using: :btree
  end

  create_table "transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "amount",        precision: 8, scale: 2
    t.string   "name"
    t.date     "date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.integer  "envelope_id"
    t.string   "envelope_name"
    t.index ["envelope_id"], name: "fk_rails_8a4805981f", using: :btree
    t.index ["user_id"], name: "fk_rails_77364e6416", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  add_foreign_key "envelopes", "users"
  add_foreign_key "transactions", "envelopes"
  add_foreign_key "transactions", "users"
end
