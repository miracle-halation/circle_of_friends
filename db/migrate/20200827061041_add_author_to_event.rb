class AddAuthorToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :user_events, :author, :boolean, default: false, null:false
  end
end
