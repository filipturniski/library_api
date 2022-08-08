class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.integer :idBook
      t.integer :idAuthor
      t.string :nameBook
      t.string :bookLocation
      t.integer :status
      t.date :createDate
      t.string :createBy
      t.date :modifyDate
      t.string :modifyBy

      t.timestamps
    end
  end
end
