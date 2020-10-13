class CreateLots < ActiveRecord::Migration[6.0]
  def change
    create_table :lots do |t|
      t.string :number, null: false
      t.string :street, null: false
      t.decimal :latitude,  precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.string :image_link
      t.text :note

      t.timestamps
    end
  end
end
