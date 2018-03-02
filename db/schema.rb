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

ActiveRecord::Schema.define(:version => 20110820232458) do

  create_table "message_urls", :force => true do |t|
    t.integer  "message_id"
    t.string   "url"
    t.string   "recipient_ip_address"
    t.string   "recipient_country"
    t.string   "recipient_state"
    t.string   "recipient_province"
    t.string   "recipient_city"
    t.integer  "attempts",             :default => 0
    t.boolean  "deleted",              :default => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "name"
    t.string   "email"
    t.datetime "accessed_at"
  end

  create_table "messages", :force => true do |t|
    t.text     "encrypted_body"
    t.text     "encrypted_password"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "deleted"
    t.string   "sender_ip_address"
    t.string   "sender_country"
    t.string   "sender_state"
    t.string   "sender_province"
    t.string   "sender_city"
    t.string   "url"
    t.text     "note"
    t.integer  "user_id"
    t.integer  "message_urls_count", :default => 0
    t.datetime "last_accessed_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.boolean  "admin",                                 :default => false
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
