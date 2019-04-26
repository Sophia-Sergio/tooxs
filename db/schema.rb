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

ActiveRecord::Schema.define(version: 2019_04_11_204349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "store_department_id"
    t.bigint "store_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "achievement", default: {}, null: false
    t.bigint "total_day"
    t.index ["store_department_id"], name: "index_achievements_on_store_department_id"
    t.index ["store_id"], name: "index_achievements_on_store_id"
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", primary_key: "cod", id: :string, force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "parent_cod"
    t.string "parents", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cod"], name: "index_categories_on_cod"
    t.index ["parent_cod"], name: "index_categories_on_parent_cod"
  end

  create_table "categories_store_departments", id: false, force: :cascade do |t|
    t.bigint "store_department_id"
    t.string "category_cod"
    t.index ["category_cod"], name: "index_categories_store_departments_on_category_cod"
    t.index ["store_department_id"], name: "index_categories_store_departments_on_store_department_id"
  end

  create_table "category_sales", force: :cascade do |t|
    t.date "date"
    t.string "category_cod"
    t.bigint "amount"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "hourly", default: {}, null: false
    t.index ["category_cod"], name: "index_category_sales_on_category_cod"
    t.index ["store_id"], name: "index_category_sales_on_store_id"
  end

  create_table "category_sales_plans", force: :cascade do |t|
    t.bigint "store_id"
    t.string "category_cod"
    t.integer "year"
    t.integer "month"
    t.bigint "monthly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "weekly", default: {}, null: false
    t.hstore "daily", default: {}, null: false
    t.index ["store_id"], name: "index_category_sales_plans_on_store_id"
  end

  create_table "clusters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
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

  create_table "optimized_productivities", force: :cascade do |t|
    t.date "date"
    t.bigint "store_department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "hourly", default: {}, null: false
    t.index ["store_department_id"], name: "index_optimized_productivities_on_store_department_id"
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

  create_table "planned_shifts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "work_shift_id"
    t.datetime "check_in"
    t.datetime "check_out"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_planned_shifts_on_user_id"
    t.index ["work_shift_id"], name: "index_planned_shifts_on_work_shift_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "brand_id"
    t.string "category_cod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_cod"], name: "index_products_on_category_cod"
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
    t.datetime "date"
    t.bigint "user_id"
    t.bigint "product_id"
    t.bigint "store_department_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_on_product_id"
    t.index ["store_department_id"], name: "index_sales_on_store_department_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "shift_breaks", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "check_in"
    t.time "check_out"
    t.integer "reason"
    t.text "reason_desc"
    t.index ["user_id"], name: "index_shift_breaks_on_user_id"
  end

  create_table "staff_requests", force: :cascade do |t|
    t.bigint "store_department_id"
    t.bigint "store_id"
    t.bigint "plan_shift_id"
    t.integer "cuantity"
    t.date "date_start"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_shift_id"], name: "index_staff_requests_on_plan_shift_id"
    t.index ["store_department_id"], name: "index_staff_requests_on_store_department_id"
    t.index ["store_id"], name: "index_staff_requests_on_store_id"
    t.index ["user_id"], name: "index_staff_requests_on_user_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.bigint "store_department_id"
    t.date "date"
    t.integer "staff_number"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_department_id"], name: "index_staffs_on_store_department_id"
  end

  create_table "store_departments", force: :cascade do |t|
    t.bigint "store_id"
    t.bigint "department_id"
    t.integer "staff"
    t.integer "department_cod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "world_id"
    t.index ["department_id"], name: "index_store_departments_on_department_id"
    t.index ["store_id"], name: "index_store_departments_on_store_id"
    t.index ["world_id"], name: "index_store_departments_on_world_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "commune"
    t.bigint "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_stores_on_cluster_id"
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
    t.string "name", null: false
    t.string "surname_1", null: false
    t.string "surname_2"
    t.string "phone"
    t.string "address"
    t.string "commune"
    t.string "avatar"
    t.string "rut"
    t.integer "status", default: 1, null: false
    t.bigint "store_id"
    t.bigint "store_department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "first_day"
    t.boolean "fixed_shift", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["rut"], name: "index_users_on_rut", unique: true
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
    t.datetime "check_in"
    t.datetime "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_worked_shifts_on_user_id"
  end

  create_table "worlds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "achievements", "store_departments"
  add_foreign_key "achievements", "stores"
  add_foreign_key "achievements", "users"
  add_foreign_key "categories_store_departments", "categories", column: "category_cod", primary_key: "cod", name: "categories_store_departments_category_cod_fkey"
  add_foreign_key "category_sales", "categories", column: "category_cod", primary_key: "cod", name: "category_sales_category_cod_fkey"
  add_foreign_key "category_sales", "stores"
  add_foreign_key "category_sales_plans", "categories", column: "category_cod", primary_key: "cod", name: "category_sales_plans_category_cod_fkey"
  add_foreign_key "category_sales_plans", "stores"
  add_foreign_key "general_plans", "store_departments"
  add_foreign_key "optimized_productivities", "store_departments"
  add_foreign_key "plan_shifts", "work_shifts"
  add_foreign_key "planned_shifts", "users"
  add_foreign_key "planned_shifts", "work_shifts"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories", column: "category_cod", primary_key: "cod", name: "products_category_cod_fkey"
  add_foreign_key "sales", "products"
  add_foreign_key "sales", "store_departments"
  add_foreign_key "sales", "users"
  add_foreign_key "shift_breaks", "users"
  add_foreign_key "staff_requests", "plan_shifts"
  add_foreign_key "staff_requests", "store_departments"
  add_foreign_key "staff_requests", "stores"
  add_foreign_key "staff_requests", "users"
  add_foreign_key "staffs", "store_departments"
  add_foreign_key "store_departments", "departments"
  add_foreign_key "store_departments", "stores"
  add_foreign_key "store_departments", "worlds"
  add_foreign_key "stores", "clusters"
  add_foreign_key "target_productivities", "store_departments"
  add_foreign_key "target_sales", "store_departments"
  add_foreign_key "user_shifts", "stores"
  add_foreign_key "user_shifts", "users"
  add_foreign_key "user_shifts", "work_shifts"
  add_foreign_key "users", "store_departments"
  add_foreign_key "users", "stores"
  add_foreign_key "worked_shifts", "users"
end
