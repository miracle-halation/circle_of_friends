class CreateUserCircles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_circles do |t|
      t.references  :user,  null:false, foreign_key: true
      t.references  :circle,  null:false, foreign_key: true
      t.timestamps
    end
  end
end
