class ChangeTracklistDatatypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :releases, :tracklist, :string
  end
end
