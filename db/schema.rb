# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090512201358) do

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tag_id"
    t.string   "language_code"
    t.integer  "user_id"
  end

  add_index "posts", ["tag_id"], :name => "index_posts_on_tag_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "posts_info", :force => true do |t|
    t.integer "post_id"
    t.integer "votes",      :default => 0
    t.text    "voters_ips"
  end

  add_index "posts_info", ["post_id"], :name => "index_posts_info_on_post_id"

  create_table "tags", :force => true do |t|
    t.string  "ki"
    t.integer "number_of_stories", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "nick"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes",      :default => 0
  end

end
