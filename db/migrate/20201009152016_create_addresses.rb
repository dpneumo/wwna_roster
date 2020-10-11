class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :number, null: false
      t.string :street, null: false
      t.string :city,  null: false, default: 'Arlington'
      t.string :state, null: false, default: 'TX'
      t.string :zip,   null: false, default: '76016'

      t.timestamps
    end
  end
end
