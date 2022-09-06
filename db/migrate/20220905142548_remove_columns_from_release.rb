class RemoveColumnsFromRelease < ActiveRecord::Migration[7.0]
  def change
    remove_column :releases, :tracklist, :string
    remove_column :releases, :favorite_tracks, :string
  end
end
