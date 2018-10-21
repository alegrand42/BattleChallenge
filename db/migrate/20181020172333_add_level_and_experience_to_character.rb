class AddLevelAndExperienceToCharacter < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :level, :integer, :default => 1
    add_column :characters, :exp, :integer, :default => 0
    add_column :characters, :win_count, :integer, :default => 0
    add_column :characters, :lose_count, :integer, :default => 0
  end
end
