# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_24_025236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text "title"
    t.text "sub_description"
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
    t.text "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imgs", default: [], array: true
  end

  create_table "experiences", force: :cascade do |t|
    t.text "title"
    t.text "sub_description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "link"
    t.string "body_points", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imgs", default: [], array: true
  end

  create_table "resume_projects", force: :cascade do |t|
    t.text "title"
    t.text "sub_description"
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
