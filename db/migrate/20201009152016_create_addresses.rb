class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :number, null: false
      t.string  :street, null: false
      t.string  :city,   null: false
      t.string  :state,  null: false, default: 'TX'
      t.string  :zip,    null: false

      t.timestamps
    end
  end
end
