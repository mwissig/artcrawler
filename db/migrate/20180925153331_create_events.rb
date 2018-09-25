class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :neighborhood
      t.string :city
      t.string :state
      t.text :description
      t.string :website
      t.boolean :private
      t.integer :user_id

      t.timestamps
    end
  end
end
