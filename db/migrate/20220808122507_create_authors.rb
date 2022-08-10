class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name_author, null: false
      t.belongs_to :status, default: 1, index: true, foreign_key: true, null: false
      t.belongs_to :creator, null: false
      t.belongs_to :updater, null: false

      t.timestamps
    end
  end
end
