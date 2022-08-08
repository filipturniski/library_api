class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.integer :idMember
      t.integer :idBook
      t.integer :status
      t.date :createDate
      t.string :createBy
      t.date :modifyDate
      t.string :modifyBy

      t.timestamps
    end
  end
end
