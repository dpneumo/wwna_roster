class CreatePersonPhones < ActiveRecord::Migration[6.0]
  def change
    create_table :person_phones do |t|
      t.integer :person_id
      t.integer :phone_id
      t.string  :locn
      t.string  :preferred

      t.timestamps
    end
  end
end
