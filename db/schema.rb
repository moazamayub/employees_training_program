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

ActiveRecord::Schema[8.1].define(version: 2026_08_26_164614) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "is_active"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.bigint "created_by_id", null: false
    t.text "description"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_courses_on_company_id"
    t.index ["created_by_id"], name: "index_courses_on_created_by_id"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "options", force: :cascade do |t|
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.text "explanation"
    t.text "option_text"
    t.bigint "slide_question_id", null: false
    t.datetime "updated_at", null: false
    t.index ["slide_question_id"], name: "index_options_on_slide_question_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.decimal "passing_score"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_quizzes_on_course_id"
  end

  create_table "slide_questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "points"
    t.text "question_text"
    t.integer "question_type"
    t.bigint "slide_id", null: false
    t.datetime "updated_at", null: false
    t.index ["slide_id"], name: "index_slide_questions_on_slide_id"
  end

  create_table "slides", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.bigint "quiz_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_slides_on_quiz_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.datetime "completed_at"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "enrolled_at"
    t.decimal "progress_percentage"
    t.decimal "score"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table "user_departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "department_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["department_id"], name: "index_user_departments_on_department_id"
    t.index ["user_id"], name: "index_user_departments_on_user_id"
  end

  create_table "user_quizes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "quiz_id", null: false
    t.decimal "score"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["quiz_id"], name: "index_user_quizes_on_quiz_id"
    t.index ["user_id"], name: "index_user_quizes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "companies"
  add_foreign_key "courses", "users", column: "created_by_id"
  add_foreign_key "departments", "companies"
  add_foreign_key "options", "slide_questions"
  add_foreign_key "quizzes", "courses"
  add_foreign_key "slide_questions", "slides"
  add_foreign_key "slides", "quizzes"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
  add_foreign_key "user_departments", "departments"
  add_foreign_key "user_departments", "users"
  add_foreign_key "user_quizes", "quizzes"
  add_foreign_key "user_quizes", "users"
  add_foreign_key "users", "companies"
end
