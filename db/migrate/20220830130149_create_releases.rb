class CreateReleases < ActiveRecord::Migration[7.0]
  def change
    create_table :releases do |t|
      t.string :artist
      t.string :title
      t.string :label
      t.string :catalog_number
      t.string :format
      t.date :released
      t.string :styles
      t.string :tracklist
      t.string :favorite_tracks
      t.string :tag
      t.string :link
      t.string :comment
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
