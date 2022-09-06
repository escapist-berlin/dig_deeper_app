class SetArrayDatatypeToTracklist < ActiveRecord::Migration[7.0]
  def change
    change_column :releases, :tracklist, "varchar[] USING (string_to_array(tracklist, ';'))"
  end
end
