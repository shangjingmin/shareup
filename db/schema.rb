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

ActiveRecord::Schema.define(:version => 20120227124954) do

  create_table "docshots", :force => true do |t|
    t.string   "url"
    t.text     "content"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "shot_times"
  end

  create_table "metadocs", :force => true do |t|
    t.string   "title"
    t.string   "tags"
    t.text     "content"
    t.string   "from_url"
    t.string   "from_mark"
    t.datetime "collect_at"
    t.boolean  "public"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "nickname"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.boolean  "public"
    t.datetime "tag_at"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "ref_count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "nickname"
    t.string   "realname"
    t.string   "mobile"
    t.string   "encrypted_password"
    t.string   "home_url"
    t.text     "biography"
    t.string   "professional"
    t.string   "focus_fields"
    t.string   "interest"
    t.date     "birthday"
    t.string   "comment"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "password_salt"
  end

end
