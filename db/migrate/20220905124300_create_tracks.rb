class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.boolean :favorite
      t.string :position
      t.references :release, null: false, foreign_key: true

      t.timestamps
    end
  end
end
