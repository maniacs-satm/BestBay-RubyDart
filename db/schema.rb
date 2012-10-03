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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20121003174013) do

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "min_price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
=======
ActiveRecord::Schema.define(:version => 20121003163219) do

  create_table "products", :force => true do |t|
    t.string   "title"
    t.float    "start_price"
    t.string   "description"
    t.integer  "owner_id"
    t.integer  "time_left"
    t.float    "current_price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'array' for column 'selling_products'
>>>>>>> f1b922cb4efd213aea0c4e6ebcfcad22c487350b

end
