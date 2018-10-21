class AddAvatarColumnsToCharacters < ActiveRecord::Migration[5.1]
  def change
      add_attachment :characters, :avatar
  end
end
