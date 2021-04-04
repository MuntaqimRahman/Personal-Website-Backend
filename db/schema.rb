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

ActiveRecord::Schema.define(version: 20210324025236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text "title"
    t.text "company"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "link"
    t.string "body_points", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "blog_title", limit: 100, null: false
    t.string "blog_content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imgs", default: [], array: true
  end

  create_table "experiences", force: :cascade do |t|
    t.text "title"
    t.text "company"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "link"
    t.string "body_points", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imgs", default: [], array: true
  end

  create_table "resume_projects", force: :cascade do |t|
    t.text "title"
    t.text "company"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "link"
    t.string "body_points", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "languages", default: [], array: true
    t.string "frameworks", default: [], array: true
    t.string "tools", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
