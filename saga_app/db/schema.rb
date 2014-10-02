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

ActiveRecord::Schema.define(version: 20141002214836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_url"
    t.string   "scope"
    t.string   "tags"
    t.string   "category"
    t.integer  "saga_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapters", ["saga_id"], name: "index_chapters_on_saga_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["chapter_id"], name: "index_comments_on_chapter_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "sagas", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sagas", ["user_id"], name: "index_sagas_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "about_me"
    t.string   "image_url"
    t.string   "gender"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
