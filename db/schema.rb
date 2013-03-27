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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130326172558) do

  create_table "banners", :force => true do |t|
    t.integer  "width"
    t.integer  "height"
    t.string   "size_type"
    t.string   "name"
    t.binary   "picture"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "calls", :force => true do |t|
    t.string   "reason"
    t.text     "comments"
    t.string   "status"
    t.datetime "call_date"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "calls", ["contact_id"], :name => "index_calls_on_contact_id"

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "support_case_id"
    t.integer  "employee_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "comments", ["employee_id"], :name => "index_comments_on_employee_id"
  add_index "comments", ["support_case_id"], :name => "index_comments_on_support_case_id"

  create_table "contact_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contact_groups_contacts", :id => false, :force => true do |t|
    t.integer "contact_id"
    t.integer "contact_group_id"
  end

  add_index "contact_groups_contacts", ["contact_id", "contact_group_id"], :name => "c_g_c_index", :unique => true

  create_table "contacts", :force => true do |t|
    t.string   "clientId"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "clientType"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.date     "dateOfBirth"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.string   "answer"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "faqs", ["subject_id"], :name => "index_faqs_on_subject_id"

  create_table "newsletters", :force => true do |t|
    t.string   "title"
    t.text     "message_body"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "subject"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "support_cases", :force => true do |t|
    t.string   "description"
    t.string   "caseType"
    t.string   "status"
    t.integer  "contact_id"
    t.integer  "employee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "support_cases", ["contact_id"], :name => "index_support_cases_on_contact_id"
  add_index "support_cases", ["employee_id"], :name => "index_support_cases_on_employee_id"

end
