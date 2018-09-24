class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :primary_medium
      t.string :secondary_medium
      t.string :portfolio
      t.string :instagram
      t.text :statement

      t.timestamps
    end
  end
end
