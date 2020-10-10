class CreateLots < ActiveRecord::Migration[6.0]
  def change
    create_table :lots do |t|
      t.integer :address_id, null: false
      t.string :tad_id
      t.string :google_maps_link
      t.string :image_link
      t.text :note

      t.timestamps
    end
  end
end
