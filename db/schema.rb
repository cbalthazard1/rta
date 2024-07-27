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

ActiveRecord::Schema[7.1].define(version: 2024_07_26_234952) do
  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "country_abbr"
    t.json "config", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "club_or_international"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "date_time"
    t.string "competition_name"
    t.integer "table_id"
    t.string "round"
    t.string "home_team_name"
    t.string "away_team_name"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_goals"
    t.integer "away_goals"
    t.integer "home_penalties"
    t.integer "away_penalties"
    t.float "home_xg"
    t.float "away_xg"
    t.integer "attendance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["date_time", "home_team_name", "away_team_name"], name: "idx_on_date_time_home_team_name_away_team_name_f241a682ba", unique: true
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["table_id"], name: "index_matches_on_table_id"
  end

  create_table "table_rows", force: :cascade do |t|
    t.integer "position"
    t.string "team_name"
    t.integer "points"
    t.integer "goal_difference"
    t.integer "table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "xg_diff_per90"
    t.integer "club_id"
    t.index ["club_id"], name: "index_table_rows_on_club_id"
    t.index ["table_id"], name: "index_table_rows_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "country_abbr"
    t.integer "level"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "config", default: {}
    t.string "gender"
    t.string "club_or_international"
  end

  add_foreign_key "matches", "away_teams"
  add_foreign_key "matches", "home_teams"
  add_foreign_key "matches", "tables"
  add_foreign_key "table_rows", "clubs"
  add_foreign_key "table_rows", "tables"
end
