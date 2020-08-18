class CreateCircles < ActiveRecord::Migration[6.0]
  def change
    create_table :circles do |t|
      t.string :name,             null:false
      t.text :description,        null:false
      t.integer :genre_id,        null:false
      t.integer :activity_id,     null:false
      t.integer :age_range_id,    null:false
      t.integer :prefecture_id,   null:false
      t.timestamps
    end
  end
end
