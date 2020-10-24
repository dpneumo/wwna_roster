class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :person_id,  null: false
      t.string  :number, null: false
      t.string  :street, null: false
      t.string  :city,   null: false
      t.string  :state,  null: false, default: 'TX'
      t.string  :zip,    null: false
      t.string  :locn,       default: "Home"
      t.string  :preferred,  default: "No"
      t.text    :note

      t.timestamps
    end
  end
end
