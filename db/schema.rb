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

ActiveRecord::Schema.define(:version => 20110309164301) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal_id"
    t.integer  "user_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     :default => 0
  end

  create_table "goals", :force => true do |t|
    t.integer  "privacy"
    t.string   "name"
    t.datetime "timeline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "completed"
    t.integer  "completion"
    t.integer  "category_id"
  end

  create_table "milestones", :force => true do |t|
    t.string   "name"
    t.integer  "type"
    t.integer  "serial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "goal_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "location"
    t.string   "username"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated"
    t.string   "name"
    t.string   "recovery"
    t.string   "activate_token"
    t.text     "about"
  end

end
