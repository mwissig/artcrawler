class AddColumnToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :approved, :boolean
  end
end
