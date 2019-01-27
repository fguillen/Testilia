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

ActiveRecord::Schema.define(:version => 20100714103225) do

  create_table "answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "test_session_id"
    t.integer  "question_id"
    t.string   "selected"
    t.string   "status",          :default => "empty", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cells", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "question_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", :force => true do |t|
    t.string   "kind"
    t.string   "name"
    t.integer  "position",   :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "subject"
    t.string   "answer_a"
    t.string   "answer_b"
    t.string   "answer_c"
    t.string   "answer_d"
    t.string   "answer_correct"
    t.string   "category"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_sessions", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "user_id"
    t.string   "status",     :default => "no-completed", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
