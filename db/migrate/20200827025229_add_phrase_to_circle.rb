class AddPhraseToCircle < ActiveRecord::Migration[6.0]
  def change
    add_column :circles, :phrase, :string, null:false
  end
end
