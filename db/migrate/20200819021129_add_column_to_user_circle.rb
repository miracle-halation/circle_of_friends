class AddColumnToUserCircle < ActiveRecord::Migration[6.0]
  def change
    add_column :user_circles, :leader, :boolean, default: false, null: false
  end
end
