class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :number, null: false
      t.string :street, null: false
      t.string :city,  null: false, default: 'Arlington'
      t.string :state, null: false, default: 'TX'
      t.string :zip,   null: false, default: '76016'
      t.string :tad_id
      t.string :google_maps_link
      t.string :image_link
      t.text :note

      t.timestamps
    end
  end
end
