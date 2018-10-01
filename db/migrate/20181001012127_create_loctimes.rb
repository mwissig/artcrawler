class CreateLoctimes < ActiveRecord::Migration[5.2]
  def change
    create_table :loctimes do |t|
      t.integer :location_id
      t.boolean :sunday
      t.time :sun_open
      t.time :sun_close
      t.boolean :monday
      t.time :mon_open
      t.time :mon_close
      t.boolean :tuesday
      t.time :tues_open
      t.time :tues_close
      t.boolean :wednesday
      t.time :weds_open
      t.time :weds_close
      t.boolean :thursday
      t.time :thurs_open
      t.time :thurs_close
      t.boolean :friday
      t.time :fri_open
      t.time :fri_close
      t.boolean :saturday
      t.time :sat_open
      t.time :sat_close

      t.timestamps
    end
  end
end
