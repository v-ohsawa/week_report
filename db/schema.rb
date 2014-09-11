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

ActiveRecord::Schema.define(version: 20140805020848) do

  create_table "projects", force: true do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "worker_id"
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "week_reports", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "done"
    t.text     "understood"
    t.text     "next"
    t.string   "year_num"
    t.string   "week_num"
    t.string   "start_day"
    t.string   "end_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end