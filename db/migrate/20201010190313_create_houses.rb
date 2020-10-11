class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.integer :address_id, null: false
      t.integer :linked_lot_id
      t.boolean :flag,   default: false
      t.boolean :rental, default: false
      t.boolean :listed, default: false
      t.string :status,  default: 'occupied'
      t.text :note

      t.timestamps
    end
  end
end
