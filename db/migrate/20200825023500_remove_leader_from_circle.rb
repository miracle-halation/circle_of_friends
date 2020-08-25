class RemoveLeaderFromCircle < ActiveRecord::Migration[6.0]
  def change
    remove_column :circles, :leader, :integer
  end
end
