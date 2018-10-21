class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.belongs_to :character, index: true
      t.belongs_to :weapon, index: true
      t.timestamps
    end
  end
end
