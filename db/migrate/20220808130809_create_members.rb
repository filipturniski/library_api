class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :idMember
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :email
      t.integer :phoneNumber
      t.integer :status
      t.date :createDate
      t.string :createBy
      t.date :modifyDate
      t.string :modifyBy

      t.timestamps
    end
  end
end
