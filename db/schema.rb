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

ActiveRecord::Schema.define(version: 20161208120034) do

  create_table "abo_newsletters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "eMail"
    t.boolean  "enable"
    t.integer  "newsletter_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["newsletter_id"], name: "index_abo_newsletters_on_newsletter_id", using: :btree
  end

  create_table "newsletters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "from"
    t.string   "to"
    t.string   "type"
    t.text     "newsHeader", limit: 65535
    t.text     "newsBody",   limit: 65535
    t.text     "newsFooter", limit: 65535
    t.text     "appendix",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "abo_newsletters", "newsletters"
end
