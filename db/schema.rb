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

ActiveRecord::Schema.define(version: 20180629120257) do

  create_table "branches", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.text     "address",    limit: 65535
    t.string   "email",      limit: 255
    t.string   "contact_no", limit: 255
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id", limit: 4
  end

  add_index "branches", ["company_id"], name: "fk_rails_9d5c1c06e3", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.text     "address",    limit: 65535
    t.string   "country",    limit: 255
    t.string   "state",      limit: 255
    t.string   "district",   limit: 255
    t.string   "city",       limit: 255
    t.integer  "pin_code",   limit: 4
    t.string   "email",      limit: 255
    t.string   "contact_no", limit: 255
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.string   "prefix",        limit: 255
    t.string   "first_name",    limit: 255
    t.string   "middle_name",   limit: 255
    t.string   "last_name",     limit: 255
    t.date     "date_of_birth"
    t.string   "gender",        limit: 255
    t.string   "contact_no",    limit: 255
    t.string   "email",         limit: 255
    t.string   "blood_group",   limit: 255
    t.string   "address",       limit: 255
    t.string   "country",       limit: 255
    t.string   "state",         limit: 255
    t.string   "district",      limit: 255
    t.string   "city",          limit: 255
    t.integer  "pin_code",      limit: 4
    t.string   "adhar_no",      limit: 255
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id",    limit: 4
    t.integer  "branch_id",     limit: 4
  end

  add_index "employees", ["branch_id"], name: "fk_rails_8604ac23f2", using: :btree
  add_index "employees", ["company_id"], name: "fk_rails_15ca1438d5", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.string   "mobile_no",       limit: 255
    t.string   "name_first",      limit: 255
    t.string   "middle_name",     limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.text     "address",         limit: 65535
    t.string   "place",           limit: 255
    t.integer  "user_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vehicle_type_id", limit: 4
    t.integer  "scheme_id",       limit: 4
    t.date     "enquiry_date"
    t.text     "description",     limit: 65535
  end

  add_index "enquiries", ["scheme_id"], name: "fk_rails_97a38ddb44", using: :btree
  add_index "enquiries", ["user_id"], name: "index_enquiries_on_user_id", using: :btree
  add_index "enquiries", ["vehicle_type_id"], name: "fk_rails_c8404dfc83", using: :btree

  create_table "schemes", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.decimal  "budget",                            precision: 10
    t.string   "down_payment",        limit: 255
    t.decimal  "intrest",                           precision: 10
    t.date     "from_date"
    t.date     "to_date"
    t.boolean  "status"
<<<<<<< HEAD
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.decimal  "installment_amount",                precision: 10
    t.string   "scheme_type",         limit: 255
    t.string   "installment",         limit: 255
    t.integer  "vehicle_type_id",     limit: 8
    t.text     "description",         limit: 65535
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
=======
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "installment_amount",               precision: 10
    t.string   "scheme_type",        limit: 255
    t.string   "installment",        limit: 255
    t.integer  "vehicle_type_id",    limit: 4
    t.text     "description",        limit: 65535
>>>>>>> 5e923a16eb1e3cfc2a94607845627ea3a0a3f41b
  end

  add_index "schemes", ["vehicle_type_id"], name: "fk_rails_8115123ef3", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "branches", "companies"
  add_foreign_key "employees", "branches"
  add_foreign_key "employees", "companies"
  add_foreign_key "enquiries", "schemes"
  add_foreign_key "enquiries", "users"
  add_foreign_key "enquiries", "vehicle_types"
  add_foreign_key "schemes", "vehicle_types"
end
