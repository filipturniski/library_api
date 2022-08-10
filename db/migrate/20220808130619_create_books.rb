class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name, index: true, null: false
      t.string :location, presence: true
      t.belongs_to :status, default: 1, index: true, foreign_key: true, null: false
      t.belongs_to :author, index: true, foreign_key: true, null: false
      t.belongs_to :creator, null: false
      t.belongs_to :updater, null: false

      t.timestamps
    end
  end
end
