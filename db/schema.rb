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

ActiveRecord::Schema[7.0].define(version: 2022_08_09_073343) do
  create_table "authors", force: :cascade do |t|
    t.string "name_author", null: false
    t.integer "status_id", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_authors_on_status_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.string "location"
    t.integer "status_id", default: 1, null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["name"], name: "index_books_on_name"
    t.index ["status_id"], name: "index_books_on_status_id"
  end

  create_table "loans", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "book_id", null: false
    t.integer "status_id", default: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_loans_on_book_id"
    t.index ["member_id"], name: "index_loans_on_member_id"
    t.index ["status_id"], name: "index_loans_on_status_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.string "email"
    t.integer "phone_number"
    t.integer "status_id", default: 1, null: false
    t.string "password_ciphertext"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_members_on_status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "descriptionStatus", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "authors", "statuses"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "statuses"
  add_foreign_key "loans", "books"
  add_foreign_key "loans", "members"
  add_foreign_key "loans", "statuses"
  add_foreign_key "members", "statuses"
end
