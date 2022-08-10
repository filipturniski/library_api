class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_foreign_key :authors, :users, column: :creator_id, primary_key: "id"
        add_foreign_key :authors, :users, column: :updater_id, primary_key: "id"

        add_foreign_key :books, :users, column: :creator_id, primary_key: "id"
        add_foreign_key :books, :users, column: :updater_id, primary_key: "id"

        add_foreign_key :users, :users, column: :creator_id, primary_key: "id"
        add_foreign_key :users, :users, column: :updater_id, primary_key: "id"

        add_foreign_key :loans, :users, column: :creator_id, primary_key: "id"
        add_foreign_key :loans, :users, column: :updater_id, primary_key: "id"
      end
      dir.down do
        remove_foreign_key :authors, :creator_id
        remove_foreign_key :authors, :updater_id

        remove_foreign_key :books, :creator_id
        remove_foreign_key :books, :updater_id

        remove_foreign_key :users, :creator_id
        remove_foreign_key :users, :updater_id

        remove_foreign_key :loans, :creator_id
        remove_foreign_key :loans, :updater_id

      end
    end
  end
end
