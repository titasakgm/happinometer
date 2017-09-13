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

ActiveRecord::Schema.define(version: 20170404024306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "a10692", id: false, force: true do |t|
    t.integer  "id"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
    t.string   "username"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "mobile"
    t.string   "hcode9"
    t.string   "hcode5"
    t.string   "offname"
    t.string   "offtype"
    t.string   "administration"
    t.string   "department"
    t.string   "division"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "person1"
    t.integer  "person2"
    t.integer  "person3"
    t.integer  "person4"
    t.integer  "person5"
    t.integer  "personall"
    t.string   "pak"
    t.string   "region"
    t.string   "province"
    t.string   "ccaatt"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.text     "text"
    t.text     "short_text"
    t.text     "help_text"
    t.integer  "weight"
    t.string   "response_class"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.boolean  "is_exclusive"
    t.integer  "display_length"
    t.string   "custom_class"
    t.string   "custom_renderer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_value"
    t.string   "api_id"
    t.string   "display_type"
    t.string   "input_mask"
    t.string   "input_mask_placeholder"
    t.string   "original_choice"
    t.boolean  "is_comment",             default: false
    t.integer  "column_id"
  end

  add_index "answers", ["api_id"], name: "uq_answers_api_id", unique: true, using: :btree

  create_table "columns", force: true do |t|
    t.integer  "question_group_id"
    t.text     "text"
    t.text     "answers_textbox"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependencies", force: true do |t|
    t.integer  "question_id"
    t.integer  "question_group_id"
    t.string   "rule"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependency_conditions", force: true do |t|
    t.integer  "dependency_id"
    t.string   "rule_key"
    t.integer  "question_id"
    t.string   "operator"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "column_id"
  end

  create_table "hpi_answers", id: false, force: true do |t|
    t.integer  "id"
    t.integer  "question_id"
    t.text     "text"
    t.text     "short_text"
    t.text     "help_text"
    t.integer  "weight"
    t.string   "response_class"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.boolean  "is_exclusive"
    t.integer  "display_length"
    t.string   "custom_class"
    t.string   "custom_renderer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_value"
    t.string   "api_id"
    t.string   "display_type"
    t.string   "input_mask"
    t.string   "input_mask_placeholder"
    t.string   "original_choice"
    t.boolean  "is_comment"
    t.integer  "column_id"
  end

  create_table "hpi_questions", id: false, force: true do |t|
    t.integer  "id"
    t.integer  "survey_section_id"
    t.integer  "question_group_id"
    t.text     "text"
    t.text     "short_text"
    t.text     "help_text"
    t.string   "pick"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.string   "display_type"
    t.boolean  "is_mandatory"
    t.integer  "display_width"
    t.string   "custom_class"
    t.string   "custom_renderer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "correct_answer_id"
    t.string   "api_id"
    t.boolean  "modifiable"
    t.boolean  "dynamically_generate"
    t.string   "dummy_blob"
    t.string   "dynamic_source"
    t.string   "report_code"
    t.boolean  "is_comment"
  end

  create_table "hpi_surveys", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "hcode5"
    t.boolean  "q_01011"
    t.boolean  "q_01012"
    t.boolean  "q_01013"
    t.boolean  "q_01014"
    t.boolean  "q_01015"
    t.boolean  "q_01016"
    t.boolean  "q_01017"
    t.string   "q_01018"
    t.boolean  "q_01021"
    t.boolean  "q_01022"
    t.string   "q_01023"
    t.boolean  "q_01031"
    t.boolean  "q_01032"
    t.boolean  "q_01033"
    t.boolean  "q_01034"
    t.boolean  "q_01035"
    t.boolean  "q_01036"
    t.string   "q_01037"
    t.string   "q_0201"
    t.string   "q_0202"
    t.string   "q_0203"
    t.string   "q_0204"
    t.string   "q_0205"
    t.string   "q_0206"
    t.string   "q_0207"
    t.string   "q_0208"
    t.string   "q_0209"
    t.string   "q_0210"
    t.string   "q_0211"
    t.string   "q_0212"
    t.string   "q_0213"
    t.string   "q_0214"
    t.string   "q_0215"
    t.string   "q_0216"
    t.string   "q_0217"
    t.string   "q_0218"
    t.string   "q_0219"
    t.string   "q_0220"
    t.string   "q_0221"
    t.string   "q_0222"
    t.string   "q_0223"
    t.string   "q_0224"
    t.string   "q_0225"
    t.string   "q_0226"
    t.string   "q_0227"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pak_reg_prov", id: false, force: true do |t|
    t.integer "id",                   default: "nextval('pak_reg_prov_id_seq'::regclass)", null: false
    t.string  "pak",      limit: nil
    t.string  "region",   limit: 2
    t.string  "pcode",    limit: 2
    t.string  "province", limit: nil
  end

  create_table "question_groups", force: true do |t|
    t.text     "text"
    t.text     "help_text"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.string   "display_type"
    t.string   "custom_class"
    t.string   "custom_renderer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id"
  end

  add_index "question_groups", ["api_id"], name: "uq_question_groups_api_id", unique: true, using: :btree

  create_table "questions", force: true do |t|
    t.integer  "survey_section_id"
    t.integer  "question_group_id"
    t.text     "text"
    t.text     "short_text"
    t.text     "help_text"
    t.string   "pick"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.string   "display_type"
    t.boolean  "is_mandatory"
    t.integer  "display_width"
    t.string   "custom_class"
    t.string   "custom_renderer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "correct_answer_id"
    t.string   "api_id"
    t.boolean  "modifiable",             default: true
    t.boolean  "dynamically_generate",   default: false
    t.string   "dummy_blob"
    t.string   "dynamic_source"
    t.string   "report_code"
    t.boolean  "is_comment",             default: false
  end

  add_index "questions", ["api_id"], name: "uq_questions_api_id", unique: true, using: :btree
  add_index "questions", ["id"], name: "q_id_ndx", using: :btree

  create_table "response_sets", force: true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.string   "access_code"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_id"
    t.boolean  "test_data",    default: false
  end

  add_index "response_sets", ["access_code"], name: "response_sets_ac_idx", unique: true, using: :btree
  add_index "response_sets", ["api_id"], name: "uq_response_sets_api_id", unique: true, using: :btree
  add_index "response_sets", ["user_id"], name: "rs_userid_ndx", using: :btree

  create_table "responses", force: true do |t|
    t.integer  "response_set_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.string   "response_group"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_section_id"
    t.string   "api_id"
    t.string   "blob"
    t.integer  "column_id"
  end

  add_index "responses", ["api_id"], name: "uq_responses_api_id", unique: true, using: :btree
  add_index "responses", ["id"], name: "r_id_ndx", using: :btree
  add_index "responses", ["response_set_id"], name: "r_rsid_ndx", using: :btree
  add_index "responses", ["survey_section_id"], name: "index_responses_on_survey_section_id", using: :btree

  create_table "rows", force: true do |t|
    t.integer  "question_group_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "survey_sections", force: true do |t|
    t.integer  "survey_id"
    t.string   "title"
    t.text     "description"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.integer  "display_order"
    t.string   "custom_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "modifiable",             default: true
  end

  create_table "survey_translations", force: true do |t|
    t.integer  "survey_id"
    t.string   "locale"
    t.text     "translation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "access_code"
    t.string   "reference_identifier"
    t.string   "data_export_identifier"
    t.string   "common_namespace"
    t.string   "common_identifier"
    t.datetime "active_at"
    t.datetime "inactive_at"
    t.string   "css_url"
    t.string   "custom_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_order"
    t.string   "api_id"
    t.integer  "survey_version",         default: 0
    t.boolean  "template",               default: false
    t.integer  "user_id"
  end

  add_index "surveys", ["access_code", "survey_version"], name: "surveys_access_code_version_idx", unique: true, using: :btree
  add_index "surveys", ["api_id"], name: "uq_surveys_api_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "validation_conditions", force: true do |t|
    t.integer  "validation_id"
    t.string   "rule_key"
    t.string   "operator"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "datetime_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.string   "unit"
    t.text     "text_value"
    t.string   "string_value"
    t.string   "response_other"
    t.string   "regexp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "validations", force: true do |t|
    t.integer  "answer_id"
    t.string   "rule"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "x10692", id: false, force: true do |t|
    t.integer  "id"
    t.string   "username"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "mobile"
    t.string   "hcode9"
    t.string   "hcode5"
    t.string   "offname"
    t.string   "offtype"
    t.string   "administration"
    t.string   "department"
    t.string   "division"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "person1"
    t.integer  "person2"
    t.integer  "person3"
    t.integer  "person4"
    t.integer  "person5"
    t.integer  "personall"
    t.string   "pak"
    t.string   "region"
    t.string   "province"
    t.string   "ccaatt"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
