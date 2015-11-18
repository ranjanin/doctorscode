# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151109050206) do

  create_table "appointments", force: true do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "appointment_date"
    t.string   "appointment_hour"
    t.integer  "user_id"
  end

  create_table "doctor_visits", force: true do |t|
    t.string   "date_of_visit"
    t.string   "doctor"
    t.string   "hospital"
    t.string   "reason_for_visit"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "family_member_id"
  end

  create_table "doctors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.string   "qualification"
    t.string   "specilization"
    t.string   "address"
    t.string   "description"
    t.integer  "user_id"
  end

  create_table "family_members", force: true do |t|
    t.string   "relation"
    t.string   "first_name"
    t.string   "date_of_birth"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "blood_group"
    t.string   "height"
    t.string   "weight"
    t.string   "known_ailments"
  end

  create_table "health_records", force: true do |t|
    t.string   "health_record_type"
    t.date     "health_record_date"
    t.string   "health_record"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "family_member_id"
  end

  create_table "patients", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "user_details", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "occupation"
    t.string   "profession"
    t.string   "marital_status"
    t.integer  "number_of_children"
    t.string   "smoking"
    t.string   "drinking"
    t.string   "exercise"
    t.string   "diet"
    t.string   "family_history"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "height"
    t.string   "weight"
    t.string   "blood_group"
    t.string   "role"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "image"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
