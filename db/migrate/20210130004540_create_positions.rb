class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.integer :person_id
      t.string :name
      t.date :start
      t.date :stop

      t.timestamps
    end
  end
end
