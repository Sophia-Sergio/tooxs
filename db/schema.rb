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

ActiveRecord::Schema.define(version: 20181018220519) do

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
    t.boolean "ten", default: false, null: false
    t.boolean "eleven", default: false, null: false
    t.boolean "twelve", default: false, null: false
    t.boolean "thirteen", default: false, null: false
    t.boolean "fourteen", default: false, null: false
    t.boolean "fifteen", default: false, null: false
    t.boolean "sixteen", default: false, null: false
    t.boolean "seventeen", default: false, null: false
    t.boolean "eighteen", default: false, null: false
    t.boolean "nineteen", default: false, null: false
    t.boolean "twenty", default: false, null: false
    t.boolean "twenty_one", default: false, null: false
    t.boolean "twenty_two", default: false, null: false
    t.boolean "twenty_three", default: false, null: false
    t.boolean "twenty_four", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_available_shifts_on_store_id"
  end

  create_table "clusters", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_cases", force: :cascade do |t|
    t.integer "turn_num"
    t.bigint "store_id"
    t.bigint "department_id"
    t.integer "day_num"
    t.integer "hour_day"
    t.float "hp_val"
    t.float "target_productivity"
    t.string "vhp"
    t.string "pov"
    t.string "lunch_in"
    t.string "lunch_hours"
    t.integer "hour_min"
    t.string "turns_matrix"
    t.string "real_dot"
    t.string "sale_plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "month"
    t.integer "year"
    t.index ["department_id"], name: "index_data_cases_on_department_id"
    t.index ["store_id"], name: "index_data_cases_on_store_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_details", force: :cascade do |t|
    t.integer "request_id"
    t.integer "department_id"
    t.integer "turn"
    t.integer "quantity"
    t.integer "rrhh"
    t.integer "internal"
    t.integer "laborum"
    t.integer "trabajando"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "return_cases", force: :cascade do |t|
    t.bigint "data_case_id"
    t.string "eff_margin"
    t.integer "total_surplus"
    t.string "compensation_cost"
    t.string "integer"
    t.string "status"
    t.string "user"
    t.string "message"
    t.integer "deficit_total"
    t.string "tolerance"
    t.string "version"
    t.string "format_result"
    t.string "max_time"
    t.string "lunchs"
    t.string "turns"
    t.string "delta"
    t.string "epsilon"
    t.string "support"
    t.string "model"
    t.integer "sales_plan"
    t.integer "obj_function"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_case_id"], name: "index_return_cases_on_data_case_id"
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

  create_table "seller_sales", force: :cascade do |t|
    t.bigint "seller_id"
    t.bigint "department_id"
    t.integer "month"
    t.integer "week"
    t.integer "day"
    t.integer "hour"
    t.float "sale"
    t.integer "turn"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_seller_sales_on_department_id"
    t.index ["seller_id"], name: "index_seller_sales_on_seller_id"
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

  create_table "staffing_cases", force: :cascade do |t|
    t.bigint "data_case_id"
    t.integer "tolerance"
    t.integer "actual_staffing_eval"
    t.integer "max_time"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_case_id"], name: "index_staffing_cases_on_data_case_id"
  end

  create_table "staffing_reals", force: :cascade do |t|
    t.bigint "department_id"
    t.bigint "store_id"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.integer "count"
    t.integer "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_staffing_reals_on_department_id"
    t.index ["store_id"], name: "index_staffing_reals_on_store_id"
  end

  create_table "store_departments", force: :cascade do |t|
    t.integer "origin_id"
    t.string "name"
    t.bigint "store_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "productivity_obj"
    t.integer "master_id"
    t.index ["department_id"], name: "index_store_departments_on_department_id"
    t.index ["origin_id"], name: "index_store_departments_on_origin_id"
    t.index ["store_id"], name: "index_store_departments_on_store_id"
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
    t.bigint "cluster_id"
    t.index ["cluster_id"], name: "index_stores_on_cluster_id"
    t.index ["origin_id"], name: "index_stores_on_origin_id"
  end

  create_table "summary_cases", force: :cascade do |t|
    t.bigint "data_case_id"
    t.string "sale_plan"
    t.string "coverange_deficit"
    t.string "surplus_coverange"
    t.string "total_deviation"
    t.string "cost_of_remunerations"
    t.string "margin_adjustment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_io"
    t.string "real_dot"
    t.index ["data_case_id"], name: "index_summary_cases_on_data_case_id"
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
    t.string "rut"
    t.string "phone"
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "district"
    t.string "county"
    t.string "country"
    t.bigint "department_id"
    t.bigint "store_id"
    t.integer "assigned_shift"
    t.date "begin_shift"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "available_shifts", "stores"
  add_foreign_key "data_cases", "departments"
  add_foreign_key "data_cases", "stores"
  add_foreign_key "return_cases", "data_cases"
  add_foreign_key "sale_plans", "departments"
  add_foreign_key "sale_plans", "stores"
  add_foreign_key "sale_reals", "departments"
  add_foreign_key "sale_reals", "stores"
  add_foreign_key "seller_sales", "departments"
  add_foreign_key "seller_sales", "sellers"
  add_foreign_key "sellers", "departments"
  add_foreign_key "sellers", "stores"
  add_foreign_key "shift_breaks", "sellers"
  add_foreign_key "staffing_cases", "data_cases"
  add_foreign_key "staffing_reals", "departments"
  add_foreign_key "staffing_reals", "stores"
  add_foreign_key "store_departments", "departments"
  add_foreign_key "store_departments", "stores"
  add_foreign_key "stores", "clusters"
  add_foreign_key "summary_cases", "data_cases"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "stores"
end
