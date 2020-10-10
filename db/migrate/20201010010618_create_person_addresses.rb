class CreatePersonAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :person_addresses do |t|
      t.integer :person_id,  null: false
      t.integer :address_id, null: false
      t.string  :locn
      t.string  :preferred,  default: "No"

      t.timestamps
    end
  end
end
