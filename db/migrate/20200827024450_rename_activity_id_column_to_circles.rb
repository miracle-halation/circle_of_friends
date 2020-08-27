class RenameActivityIdColumnToCircles < ActiveRecord::Migration[6.0]
  def change
    rename_column :circles, :activity_id, :activity
    rename_column :circles, :age_range_id, :age_range
  end
end
