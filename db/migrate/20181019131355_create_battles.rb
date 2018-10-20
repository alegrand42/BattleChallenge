class CreateBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :battles do |t|
      t.integer :player_one_id
      t.integer :player_two_id
      t.integer :winner_id
      t.integer :turn
      t.text    :historic

      t.timestamps
    end
  end
end
