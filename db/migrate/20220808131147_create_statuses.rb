class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.integer :idStatus
      t.string :descriptionStatus

      t.timestamps
    end
  end
end
