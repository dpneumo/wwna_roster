class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.uuid    :person_id,  null: false
      t.string  :number, null: false
      t.string  :street, null: false
      t.string  :city,   null: false
      t.string  :state,  null: false, default: 'TX'
      t.string  :zip,    null: false
      t.string  :address_type,       default: "Home"
      t.boolean :preferred,  default: false
      t.text    :note

      t.timestamps
    end

    add_index :addresses, :person_id
  end
end
