class CreateOccupants < ActiveRecord::Migration[6.0]
  def change
    create_table :occupants do |t|
      t.integer :house_id,  null: false
      t.integer :person_id, null: false
      t.string :relation
      t.string :status, default: 'Other'
      t.text :note

      t.timestamps
    end
  end
end
