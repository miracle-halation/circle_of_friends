class AddCityToCircle < ActiveRecord::Migration[6.0]
  def change
    add_column :circles, :city, :string, null:false
  end
end
