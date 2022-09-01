class AddFieldToRelease < ActiveRecord::Migration[7.0]
  def change
    add_column :releases, :cover_url, :string
  end
end
