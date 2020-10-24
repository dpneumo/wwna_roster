class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.integer :person_id, null: false
      t.string  :cc, default: "1"
      t.string  :area,   null: false
      t.string  :prefix, null: false
      t.string  :number, null: false
      t.string  :locn
      t.string  :preferred, default: "No"
      t.boolean :txt_capable, default: false
      t.text    :note

      t.timestamps
    end
  end
end
