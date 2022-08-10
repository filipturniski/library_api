class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.belongs_to :user,  index: true, foreign_key: true, null: false
      t.belongs_to :book, index: true, foreign_key: true, null: false
      t.belongs_to :status, default: 3, index: true, foreign_key: true, null: false

      t.belongs_to :creator, null: false
      t.belongs_to :updater, null: false

      t.timestamps
    end
  end
end
