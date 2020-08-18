class AddColumnToCircle < ActiveRecord::Migration[6.0]
  def change
    add_column :circles, :leader, :integer, null: false
  end
end
