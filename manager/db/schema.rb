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

ActiveRecord::Schema.define(:version => 20120502065441) do

  create_table "clusters", :force => true do |t|
    t.string  "name"
    t.integer "type_id"
  end

  add_index "clusters", ["id"], :name => "cluster_id", :unique => true

  create_table "datacenters", :force => true do |t|
    t.string  "name"
    t.integer "location_id"
  end

  add_index "datacenters", ["id"], :name => "datacenter_id", :unique => true

  create_table "datalogs", :force => true do |t|
    t.integer  "server_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "country"
  end

  add_index "locations", ["id"], :name => "location_id", :unique => true

  create_table "servers", :force => true do |t|
    t.string  "name"
    t.string  "ipaddress"
    t.string  "model"
    t.integer "cluster_id"
  end

  add_index "servers", ["id"], :name => "datalog_id", :unique => true
  add_index "servers", ["id"], :name => "server_id", :unique => true

  create_table "types", :force => true do |t|
    t.string "name"
  end

  add_index "types", ["id"], :name => "type_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
