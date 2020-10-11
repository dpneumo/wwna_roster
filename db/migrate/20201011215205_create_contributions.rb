class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.integer :house_id,  null: false
      t.date    :date_paid, null: false
      t.decimal :amount,    null: false, precision: 4, scale: 2

      t.timestamps
    end
  end
end
