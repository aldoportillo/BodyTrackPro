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

ActiveRecord::Schema[7.1].define(version: 2023_12_18_232359) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "macros", force: :cascade do |t|
    t.float "fat"
    t.float "protein"
    t.float "carb"
    t.float "calories"
    t.float "sugar"
    t.float "added_sugar"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metrics", force: :cascade do |t|
    t.float "weight"
    t.float "fat_percentage"
    t.float "muscle_percentage"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_macros", force: :cascade do |t|
    t.float "carb"
    t.float "fat"
    t.float "protein"
    t.float "calories"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.float "height"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sex"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
