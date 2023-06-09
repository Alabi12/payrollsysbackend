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

ActiveRecord::Schema[7.0].define(version: 2023_05_15_223250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.date "hire_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payroll_entries", force: :cascade do |t|
    t.bigint "payroll_period_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "salary_id", null: false
    t.decimal "hours_worked"
    t.decimal "vacation_hours"
    t.decimal "sick_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payroll_entries_on_employee_id"
    t.index ["payroll_period_id"], name: "index_payroll_entries_on_payroll_period_id"
    t.index ["salary_id"], name: "index_payroll_entries_on_salary_id"
  end

  create_table "payroll_periods", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.decimal "amount"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_salaries_on_employee_id"
  end

  add_foreign_key "payroll_entries", "employees"
  add_foreign_key "payroll_entries", "payroll_periods"
  add_foreign_key "payroll_entries", "salaries"
  add_foreign_key "salaries", "employees"
end
