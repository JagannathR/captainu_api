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

ActiveRecord::Schema.define(version: 2021_08_18_101158) do

  create_table "assessments", charset: "utf8mb3", force: :cascade do |t|
    t.integer "rating"
    t.string "assessment_type"
    t.bigint "user_id", null: false
    t.bigint "tournament_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_assessments_on_player_id"
    t.index ["tournament_id"], name: "index_assessments_on_tournament_id"
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "notes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "note"
    t.bigint "assessment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assessment_id"], name: "index_notes_on_assessment_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "players", charset: "utf8mb3", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "height"
    t.integer "weight"
    t.string "birthday"
    t.integer "graduation_year"
    t.string "position"
    t.boolean "recruit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "age_group"
    t.string "coach"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tournaments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "assessments", "players"
  add_foreign_key "assessments", "tournaments"
  add_foreign_key "assessments", "users"
  add_foreign_key "notes", "assessments"
  add_foreign_key "notes", "users"
end
