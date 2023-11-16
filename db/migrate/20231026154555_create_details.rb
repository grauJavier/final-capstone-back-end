class CreateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :details do |t|
      t.references :place, null: false, foreign_key: true
      t.string :place_type
      t.integer :bedrooms
      t.integer :beds
      t.integer :bathrooms
      t.string :property_type
      t.integer :price

      t.timestamps
    end
  end
end
