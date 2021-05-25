class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :equipment_type
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
