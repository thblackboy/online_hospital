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

ActiveRecord::Schema[7.0].define(version: 2023_06_03_175741) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fio", limit: 80, null: false
    t.string "phone_number", limit: 20, null: false
    t.string "adress"
    t.date "birthday", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["phone_number"], name: "index_clients_on_phone_number"
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "doctors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fio", limit: 80, null: false
    t.string "phone_number", limit: 20, null: false
    t.string "speciality", limit: 80, null: false
    t.date "birthday", null: false
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["phone_number"], name: "index_doctors_on_phone_number"
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.date "event_data", null: false
    t.time "event_time", null: false
    t.boolean "is_done", default: false, null: false
    t.boolean "is_canceled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id", null: false
    t.bigint "doctor_id", null: false
    t.index ["client_id"], name: "index_events_on_client_id"
    t.index ["doctor_id"], name: "index_events_on_doctor_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "note", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "doctor_id", null: false
    t.bigint "client_id", null: false
    t.bigint "event_id", null: false
    t.index ["client_id"], name: "index_reports_on_client_id"
    t.index ["created_at"], name: "index_reports_on_created_at"
    t.index ["doctor_id"], name: "index_reports_on_doctor_id"
    t.index ["event_id"], name: "index_reports_on_event_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.text "schedule", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "doctor_id", null: false
    t.index ["doctor_id"], name: "index_schedules_on_doctor_id"
  end

  add_foreign_key "events", "clients"
  add_foreign_key "events", "doctors"
  add_foreign_key "reports", "clients"
  add_foreign_key "reports", "doctors"
  add_foreign_key "reports", "events"
  add_foreign_key "schedules", "doctors"
end
