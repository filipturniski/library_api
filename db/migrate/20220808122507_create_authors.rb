class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.integer :idAuthor
      t.string :nameAuthor
      t.integer :status
      t.date :createDate
      t.string :createBy
      t.date :modifyDate
      t.string :modifyBy

      t.timestamps
    end
  end
end
