class CreateAccommodations < ActiveRecord::Migration[7.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.references :accommodation_details, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
