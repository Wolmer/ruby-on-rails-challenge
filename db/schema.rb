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

ActiveRecord::Schema.define(version: 2021_02_13_164242) do

  create_table "campuses", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "university_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["university_id"], name: "index_campuses_on_university_id"
  end

  create_table "campuses_courses", id: false, force: :cascade do |t|
    t.integer "campus_id", null: false
    t.integer "course_id", null: false
    t.index ["campus_id"], name: "index_campuses_courses_on_campus_id"
    t.index ["course_id"], name: "index_campuses_courses_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "level"
    t.string "shift"
    t.float "price"
    t.integer "university_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["university_id"], name: "index_courses_on_university_id"
  end

  create_table "offers", force: :cascade do |t|
    t.float "price_with_discount"
    t.float "discount_percentage"
    t.string "enrollment_semester"
    t.boolean "enabled"
    t.date "start_date"
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_offers_on_course_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.float "score"
    t.text "logo_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "campuses", "universities"
  add_foreign_key "courses", "universities"
  add_foreign_key "offers", "courses"
end
