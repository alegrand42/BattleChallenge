class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :hp
      t.integer :attack
      t.integer :armor
      t.text :background

      t.timestamps
    end
  end
end
