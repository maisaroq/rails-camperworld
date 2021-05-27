class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :listings, :image, :listing_photo
  end
end
