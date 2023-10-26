class CreateAccommodationDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :accommodation_details do |t|
      t.references :accommodation, null: false, foreign_key: true
      t.string :accommodation_type
      t.integer :bedrooms
      t.integer :beds
      t.integer :bathrooms
      t.string :property_type
      t.integer :price

      t.timestamps
    end
  end
end
