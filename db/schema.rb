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

ActiveRecord::Schema[7.1].define(version: 2024_07_15_233323) do
  create_table "table_rows", force: :cascade do |t|
    t.integer "position"
    t.string "team_name"
    t.integer "points"
    t.integer "goal_difference"
    t.integer "table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "xg_diff_per90"
    t.index ["table_id"], name: "index_table_rows_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "country_abbr"
    t.integer "level"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "config", default: {}
  end

  add_foreign_key "table_rows", "tables"
end
