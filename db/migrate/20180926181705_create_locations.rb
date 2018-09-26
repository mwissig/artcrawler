class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :type
      t.string :name
      t.integer :event_id
      t.integer :user_id
      t.text :description
      t.string :address
      t.string :suite

      t.timestamps
    end
  end
end
