class RemoveAuthorFromUserEvent < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_events, :author, :boolean
  end
end
