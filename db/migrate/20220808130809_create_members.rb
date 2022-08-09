class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false, unique: true
      t.string :email
      t.integer :phone_number
      t.belongs_to :status, default: 1, index: true, foreign_key: true, null: false
      #t.belongs_to :creator, index: true, foreign_key: true
      #t.belongs_to :updater, index: true, foreign_key: true

      t.timestamps
    end
  end
end
