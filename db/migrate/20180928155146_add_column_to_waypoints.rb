class AddColumnToWaypoints < ActiveRecord::Migration[5.2]
  def change
    add_column :waypoints, :event_id, :integer
  end
end
