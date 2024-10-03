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

ActiveRecord::Schema[7.0].define(version: 2024_10_03_131749) do
  create_table "equipment_reservations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "equipment_name", limit: 100, null: false
    t.datetime "reservation_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_equipment_reservations_on_member_id"
    t.index ["reservation_time"], name: "index_equipment_reservations_on_reservation_time"
  end

  create_table "members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", limit: 100, null: false
    t.string "last_name", limit: 100, null: false
    t.string "email", limit: 100, null: false
    t.string "phone_number", limit: 15
    t.bigint "membership_plan_id", null: false
    t.date "join_date", null: false
    t.bigint "membership_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["membership_plan_id"], name: "index_members_on_membership_plan_id"
    t.index ["membership_status_id"], name: "index_members_on_membership_status_id"
  end

  create_table "membership_plans", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.integer "duration_in_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_membership_plans_on_name", unique: true
  end

  create_table "membership_statuses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "status_name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_name"], name: "index_membership_statuses_on_status_name", unique: true
  end

  create_table "payment_methods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "method_name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["method_name"], name: "index_payment_methods_on_method_name", unique: true
  end

  create_table "payments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.datetime "payment_date", null: false
    t.bigint "payment_method_id", null: false
    t.bigint "membership_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_payments_on_member_id"
    t.index ["membership_plan_id"], name: "index_payments_on_membership_plan_id"
    t.index ["payment_date"], name: "index_payments_on_payment_date"
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
  end

  create_table "usage_histories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.datetime "check_in_time", null: false
    t.datetime "check_out_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["check_in_time"], name: "index_usage_histories_on_check_in_time"
    t.index ["member_id"], name: "index_usage_histories_on_member_id"
  end

  add_foreign_key "equipment_reservations", "members"
  add_foreign_key "members", "membership_plans"
  add_foreign_key "members", "membership_statuses"
  add_foreign_key "payments", "members"
  add_foreign_key "payments", "membership_plans"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "usage_histories", "members"
end
