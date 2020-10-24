class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.integer :house_id,  null:false
      t.integer :person_id, null:false

      t.timestamps
    end
  end
end
