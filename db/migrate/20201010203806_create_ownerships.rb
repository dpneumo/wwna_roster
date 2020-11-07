class CreateOwnerships < ActiveRecord::Migration[6.0]
  def change
    create_table :ownerships do |t|
      t.integer :house_id,  null:false
      t.integer :person_id, null:false

      t.timestamps
    end
  end
end
