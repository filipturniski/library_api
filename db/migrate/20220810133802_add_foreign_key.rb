class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    #TODO sloziti FK tako da imam kontrolu tko updejta/editira podatke

    #add_foreign_key :authors, :users, column: :creator_id, primary_key: "id"
    #add_foreign_key :authors, :users, column: :updater_id, primary_key: "id"
  end
end
