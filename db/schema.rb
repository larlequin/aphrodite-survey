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

ActiveRecord::Schema.define(version: 20160505140340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.integer  "question_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions_words", id: false, force: true do |t|
    t.integer "question_id"
    t.integer "word_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "email"
    t.integer  "age"
    t.date     "birthdate"
    t.string   "gender"
    t.string   "quebeker"
    t.integer  "yearsquebec"
    t.string   "mothertongue"
    t.string   "languages"
    t.integer  "education"
    t.string   "highestscol"
    t.string   "neurotb"
    t.string   "psytb"
    t.string   "medoc"
    t.string   "question1"
    t.string   "question2"
    t.string   "question3"
    t.string   "trouble"
    t.integer  "student_group_id"
    t.datetime "start"
    t.datetime "stop"
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
