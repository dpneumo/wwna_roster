class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string  :nickname
      t.string  :first, null: false
      t.string  :middle
      t.string  :last,  null: false
      t.string  :suffix
      t.string  :honorific
      t.string  :role
      t.string  :status
      t.integer :pref_email_id
      t.integer :pref_phone_id
      t.integer :pref_address_id
      t.integer :house_id
      t.text    :note

      t.timestamps
    end
  end
end
