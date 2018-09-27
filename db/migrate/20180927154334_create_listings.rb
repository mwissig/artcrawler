class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :location_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
