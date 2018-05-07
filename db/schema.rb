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

ActiveRecord::Schema.define(version: 20180507181518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_shifts", force: :cascade do |t|
    t.bigint "store_id"
    t.integer "num"
    t.string "name"
    t.integer "month"
    t.integer "week"
    t.string "day"
    t.boolean "nine", default: false, null: false
    t.boolean "ten"
    t.boolean "eleven"
    t.boolean "twelve"
    t.boolean "thirteen"
    t.boolean "fourteen"
    t.boolean "fifteen"
    t.boolean "sixteen"
    t.boolean "seventeen"
    t.boolean "eighteen"
    t.boolean "nineteen"
    t.boolean "twenty"
    t.boolean "twenty_one"
    t.boolean "twenty_two"
    t.boolean "twenty_three"
    t.boolean "twenty_four"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_available_shifts_on_store_id"
  end

  create_table "data_cases", force: :cascade do |t|
    t.integer "id_case"
    t.integer "turn_num"
    t.integer "dep_num"
    t.integer "day_num"
    t.integer "hour_day"
    t.float "hp_val"
    t.float "prod_obj"
    t.string "vhp"
    t.string "pov"
    t.string "luch_in"
    t.string "lunch_hours"
    t.integer "hour_min"
    t.string "turns_matrix"
    t.string "real_dot"
    t.string "sale_plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer "origin_id"
    t.string "name"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "productivity_obj"
    t.index ["origin_id"], name: "index_departments_on_origin_id"
    t.index ["store_id"], name: "index_departments_on_store_id"
  end

  create_table "historic_sales", force: :cascade do |t|
    t.bigint "department_id"
    t.bigint "nine", default: 0
    t.bigint "ten", default: 0
    t.bigint "eleven", default: 0
    t.bigint "twelve", default: 0
    t.bigint "thirteen", default: 0
    t.bigint "fourteen", default: 0
    t.bigint "fifteen", default: 0
    t.bigint "sixteen", default: 0
    t.bigint "seventeen", default: 0
    t.bigint "eighteen", default: 0
    t.bigint "nineteen", default: 0
    t.bigint "twenty", default: 0
    t.bigint "twenty_one", default: 0
    t.bigint "twenty_two", default: 0
    t.bigint "twenty_three", default: 0
    t.bigint "twenty_four", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "historic_date"
    t.bigint "store_id"
    t.integer "week"
    t.integer "month"
    t.integer "year"
    t.integer "day_number"
    t.index ["department_id"], name: "index_historic_sales_on_department_id"
    t.index ["store_id"], name: "index_historic_sales_on_store_id"
  end

  create_table "hs", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "department_id"
    t.date "date"
    t.integer "year"
    t.integer "month"
    t.integer "week"
    t.integer "dow"
    t.bigint "nine"
    t.bigint "ten"
    t.bigint "eleven"
    t.bigint "twelve"
    t.bigint "thirteen"
    t.bigint "fourteen"
    t.bigint "fifteen"
    t.bigint "sixteen"
    t.bigint "seventeen"
    t.bigint "eighteen"
    t.bigint "nineteen"
    t.bigint "twenty"
    t.bigint "twenty_one"
    t.bigint "twenty_two"
    t.bigint "twenty_three"
    t.bigint "total_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_hs_on_department_id"
    t.index ["store_id"], name: "index_hs_on_store_id"
  end

  create_table "rs", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "department_id"
    t.date "date"
    t.integer "year"
    t.integer "month"
    t.integer "week"
    t.integer "dow"
    t.bigint "nine"
    t.bigint "ten"
    t.bigint "eleven"
    t.bigint "twelve"
    t.bigint "thirteen"
    t.bigint "fourteen"
    t.bigint "fifteen"
    t.bigint "sixteen"
    t.bigint "seventeen"
    t.bigint "eighteen"
    t.bigint "nineteen"
    t.bigint "twenty"
    t.bigint "twenty_one"
    t.bigint "twenty_two"
    t.bigint "twenty_three"
    t.bigint "total_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_rs_on_department_id"
    t.index ["store_id"], name: "index_rs_on_store_id"
  end

  create_table "sale_by_sellers", force: :cascade do |t|
    t.integer "seller"
    t.integer "month"
    t.integer "week"
    t.integer "day"
    t.integer "hour"
    t.integer "department"
    t.float "sale"
    t.integer "turn"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_plans", force: :cascade do |t|
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "sale_date"
    t.bigint "nine"
    t.bigint "ten"
    t.bigint "eleven"
    t.bigint "twelve"
    t.bigint "thirteen"
    t.bigint "fourteen"
    t.bigint "fifteen"
    t.bigint "sixteen"
    t.bigint "seventeen"
    t.bigint "eighteen"
    t.bigint "nineteen"
    t.bigint "twenty"
    t.bigint "twenty_one"
    t.bigint "twenty_two"
    t.bigint "twenty_three"
    t.bigint "twenty_four"
    t.bigint "store_id"
    t.integer "week"
    t.integer "month"
    t.integer "year"
    t.integer "day_number"
    t.index ["department_id"], name: "index_sale_plans_on_department_id"
    t.index ["store_id"], name: "index_sale_plans_on_store_id"
  end

  create_table "sale_reals", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "department_id"
    t.date "sale_date"
    t.bigint "nine"
    t.bigint "ten"
    t.bigint "eleven"
    t.bigint "twelve"
    t.bigint "thirteen"
    t.bigint "fourteen"
    t.bigint "fifteen"
    t.bigint "sixteen"
    t.bigint "seventeen"
    t.bigint "eighteen"
    t.bigint "nineteen"
    t.bigint "twenty"
    t.bigint "twenty_one"
    t.bigint "twenty_two"
    t.bigint "twenty_three"
    t.bigint "twenty_four"
    t.integer "week"
    t.integer "month"
    t.integer "year"
    t.integer "day_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_sale_reals_on_department_id"
    t.index ["store_id"], name: "index_sale_reals_on_store_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "rut"
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "district"
    t.string "county"
    t.string "country"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.integer "assigned_shift"
    t.date "begin_shift"
    t.index ["department_id"], name: "index_sellers_on_department_id"
    t.index ["store_id"], name: "index_sellers_on_store_id"
  end

  create_table "shift_breaks", force: :cascade do |t|
    t.bigint "seller_id"
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_shift_breaks_on_seller_id"
  end

  create_table "sps", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "department_id"
    t.date "date"
    t.integer "year"
    t.integer "month"
    t.integer "week"
    t.integer "dow"
    t.integer "sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_sps_on_department_id"
    t.index ["store_id"], name: "index_sps_on_store_id"
  end

  create_table "staffing_cases", force: :cascade do |t|
    t.integer "id_case"
    t.integer "tolerance"
    t.integer "actual_staffing_eval"
    t.integer "max_time"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "district"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "origin_id"
    t.string "county"
    t.string "size"
    t.string "economic_segment"
    t.index ["origin_id"], name: "index_stores_on_origin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "lastname"
    t.string "surname"
    t.integer "role"
    t.string "picture"
    t.integer "status"
    t.string "position"
    t.integer "rut"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "available_shifts", "stores"
  add_foreign_key "departments", "stores"
  add_foreign_key "historic_sales", "departments"
  add_foreign_key "historic_sales", "stores"
  add_foreign_key "hs", "departments"
  add_foreign_key "hs", "stores"
  add_foreign_key "rs", "departments"
  add_foreign_key "rs", "stores"
  add_foreign_key "sale_plans", "departments"
  add_foreign_key "sale_plans", "stores"
  add_foreign_key "sale_reals", "departments"
  add_foreign_key "sale_reals", "stores"
  add_foreign_key "sellers", "departments"
  add_foreign_key "sellers", "stores"
  add_foreign_key "shift_breaks", "sellers"
  add_foreign_key "sps", "departments"
  add_foreign_key "sps", "stores"
end
