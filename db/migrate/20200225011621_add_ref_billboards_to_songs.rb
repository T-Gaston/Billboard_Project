class AddRefBillboardsToSongs < ActiveRecord::Migration[6.0]
  def change
    add_reference :songs, :billboard, foreign_key: true
  end
end
