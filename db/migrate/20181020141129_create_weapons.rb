class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
        t.string :name
        t.text :detail
      
        t.integer :power
        t.boolean :shield, :default => false
      
        t.timestamps
    end
  end
end
