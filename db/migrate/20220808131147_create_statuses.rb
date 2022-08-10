class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :description_status, null: false

      t.timestamps
    end
  end
end
