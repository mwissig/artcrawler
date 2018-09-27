class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :locations, :type, :loc_type
  end
end
