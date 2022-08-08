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

ActiveRecord::Schema[7.0].define(version: 2022_08_08_170011) do
  create_table "authors", force: :cascade do |t|
    t.integer "idAuthor"
    t.string "nameAuthor"
    t.integer "status"
    t.date "createDate"
    t.string "createBy"
    t.date "modifyDate"
    t.string "modifyBy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer "idBook"
    t.integer "idAuthor"
    t.string "nameBook"
    t.string "bookLocation"
    t.integer "status"
    t.date "createDate"
    t.string "createBy"
    t.date "modifyDate"
    t.string "modifyBy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "idMember"
    t.integer "idBook"
    t.integer "status"
    t.date "createDate"
    t.string "createBy"
    t.date "modifyDate"
    t.string "modifyBy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "idMember"
    t.string "firstName"
    t.string "lastName"
    t.string "username"
    t.string "email"
    t.integer "phoneNumber"
    t.integer "status"
    t.date "createDate"
    t.string "createBy"
    t.date "modifyDate"
    t.string "modifyBy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "idStatus"
    t.string "descriptionStatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
