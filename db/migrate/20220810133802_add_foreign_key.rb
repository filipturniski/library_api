class AddForeignKey < ActiveRecord::Migration[7.0]
  def change

    add_foreign_key :authors, :users, column: :creator_id, primary_key: "id"
    add_foreign_key :authors, :users, column: :updater_id, primary_key: "id"

    add_foreign_key :books, :users, column: :creator_id, primary_key: "id"
    add_foreign_key :books, :users, column: :updater_id, primary_key: "id"

    add_foreign_key :users, :users, column: :creator_id, primary_key: "id"
    add_foreign_key :users, :users, column: :updater_id, primary_key: "id"

    add_foreign_key :loans, :users, column: :creator_id, primary_key: "id"
    add_foreign_key :loans, :users, column: :updater_id, primary_key: "id"
  end
end
