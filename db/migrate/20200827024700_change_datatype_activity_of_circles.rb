class ChangeDatatypeActivityOfCircles < ActiveRecord::Migration[6.0]
  def change
    change_column :circles, :activity, :string, null:false
    change_column :circles, :age_range, :string, null:false
  end
end
