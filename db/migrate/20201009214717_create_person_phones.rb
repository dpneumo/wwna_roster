class CreatePersonPhones < ActiveRecord::Migration[6.0]
  def change
    create_table :person_phones do |t|
      t.integer :person_id, null: false
      t.integer :phone_id,  null: false
      t.string  :locn
      t.string  :preferred, default: "No"

      t.timestamps
    end
  end
end
