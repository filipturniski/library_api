class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name_author, null: false
      t.belongs_to :status, default: 1, index: true, foreign_key: true
      #t.belongs_to :creator, index: true, foreign_key: true
      #t.belongs_to :updater, index: true, foreign_key: true

      t.timestamps
    end
  end
end
