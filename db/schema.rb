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

ActiveRecord::Schema.define(version: 20161203061450) do

  create_table "cats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inspections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "test_id"
    t.text     "answer",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "mark"
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "ask",        limit: 4294967295
    t.text     "answer",     limit: 4294967295
    t.integer  "cat_id"
    t.integer  "mark"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "time"
  end

  create_table "tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 4294967295
    t.string   "password"
    t.datetime "start_t"
    t.boolean  "active",                         default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "tpublics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "task_id"
    t.integer  "test_id"
    t.integer  "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "test_id"
    t.integer  "user_id"
    t.integer  "mark"
    t.integer  "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "onload"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "login"
    t.string   "password"
    t.string   "secret"
    t.text     "img",         limit: 4294967295
    t.integer  "status_user"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "uses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "db_base",    limit: 4294967295
    t.text     "db_shadow",  limit: 4294967295
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
