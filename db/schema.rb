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

ActiveRecord::Schema.define(version: 20190111162507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "achievements", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "store_department_id"
    t.bigint "store_id"
    t.date "date"
    t.integer "year"
    t.integer "month"
    t.integer "week"
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "achievement", default: {}, null: false
    t.integer "total_day"
    t.index ["store_department_id"], name: "index_achievements_on_store_department_id"
    t.index ["store_id"], name: "index_achievements_on_store_id"
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.integer "parent_id"
    t.string "cod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clusters", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_cases", force: :cascade do |t|
    t.integer "turn_num"
    t.bigint "store_department_id"
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
    t.index ["store_department_id"], name: "index_data_cases_on_store_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "staff_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "general_plans", force: :cascade do |t|
    t.bigint "store_department_id"
    t.integer "value", default: 0, null: false
    t.integer "period", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_department_id"], name: "index_general_plans_on_store_department_id"
  end

  create_table "plan_shifts", force: :cascade do |t|
    t.bigint "work_shift_id"
    t.integer "week"
    t.integer "day"
    t.time "check_in"
    t.time "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_shift_id"], name: "index_plan_shifts_on_work_shift_id"
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

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "store_department_id"
    t.date "sale_date"
    t.integer "week"
    t.integer "month"
    t.integer "year"
    t.integer "day_number"
    t.integer "nine"
    t.integer "ten"
    t.integer "eleven"
    t.integer "twelve"
    t.integer "thirteen"
    t.integer "fourteen"
    t.integer "fifteen"
    t.integer "sixteen"
    t.integer "seventeen"
    t.integer "eighteen"
    t.integer "nineteen"
    t.integer "twenty"
    t.integer "twenty_one"
    t.integer "twenty_two"
    t.integer "twenty_three"
    t.integer "twenty_four"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_department_id"], name: "index_sales_on_store_department_id"
  end

  create_table "shift_breaks", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shift_breaks_on_user_id"
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

  create_table "staffs", force: :cascade do |t|
    t.bigint "store_department_id"
    t.integer "year"
    t.integer "month"
    t.integer "week"
    t.integer "day"
    t.integer "staff_number"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_department_id"], name: "index_staffs_on_store_department_id"
  end

  create_table "store_departments", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "productivity_obj"
    t.integer "master_id"
    t.index ["department_id"], name: "index_store_departments_on_department_id"
    t.index ["store_id"], name: "index_store_departments_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "commune"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "county"
    t.string "size"
    t.string "economic_segment"
    t.bigint "cluster_id"
    t.index ["cluster_id"], name: "index_stores_on_cluster_id"
  end

  create_table "summary_cases", force: :cascade do |t|
    t.bigint "data_case_id"
    t.integer "sale_plan"
    t.integer "coverange_deficit"
    t.integer "surplus_coverange"
    t.integer "total_deviation"
    t.integer "cost_of_remunerations"
    t.decimal "margin_adjustment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_io"
    t.hstore "real_dot", default: {}, null: false
    t.index ["data_case_id"], name: "index_summary_cases_on_data_case_id"
  end

  create_table "target_productivities", force: :cascade do |t|
    t.bigint "store_department_id"
    t.integer "month", null: false
    t.integer "year", null: false
    t.integer "week", null: false
    t.integer "period", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_department_id"], name: "index_target_productivities_on_store_department_id"
  end

  create_table "target_sales", force: :cascade do |t|
    t.bigint "store_department_id"
    t.integer "month", null: false
    t.integer "year", null: false
    t.integer "week", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_department_id"], name: "index_target_sales_on_store_department_id"
  end

  create_table "user_shifts", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "work_shift_id"
    t.bigint "user_id"
    t.integer "year"
    t.integer "month"
    t.integer "week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 1
    t.index ["store_id"], name: "index_user_shifts_on_store_id"
    t.index ["user_id"], name: "index_user_shifts_on_user_id"
    t.index ["work_shift_id"], name: "index_user_shifts_on_work_shift_id"
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
    t.string "surname_1"
    t.string "surname_2"
    t.string "picture"
    t.integer "status", default: 1
    t.string "rut"
    t.string "phone"
    t.string "address"
    t.string "commune"
    t.bigint "store_department_id"
    t.bigint "store_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_department_id"], name: "index_users_on_store_department_id"
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "work_shifts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "week_hours", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worked_shifts", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.integer "month"
    t.integer "week"
    t.integer "day"
    t.datetime "check_in"
    t.datetime "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_worked_shifts_on_user_id"
  end

  add_foreign_key "achievements", "store_departments"
  add_foreign_key "achievements", "stores"
  add_foreign_key "achievements", "users"
  add_foreign_key "data_cases", "store_departments"
  add_foreign_key "general_plans", "store_departments"
  add_foreign_key "plan_shifts", "work_shifts"
  add_foreign_key "return_cases", "data_cases"
  add_foreign_key "sales", "store_departments"
  add_foreign_key "shift_breaks", "users"
  add_foreign_key "staffing_cases", "data_cases"
  add_foreign_key "staffs", "store_departments"
  add_foreign_key "store_departments", "departments"
  add_foreign_key "store_departments", "stores"
  add_foreign_key "stores", "clusters"
  add_foreign_key "summary_cases", "data_cases"
  add_foreign_key "target_productivities", "store_departments"
  add_foreign_key "target_sales", "store_departments"
  add_foreign_key "user_shifts", "stores"
  add_foreign_key "user_shifts", "users"
  add_foreign_key "user_shifts", "work_shifts"
  add_foreign_key "users", "store_departments"
  add_foreign_key "users", "stores"
  add_foreign_key "worked_shifts", "users"
end
