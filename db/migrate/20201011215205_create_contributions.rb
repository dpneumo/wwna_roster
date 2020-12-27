class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.integer   :house_id,  null: false
      t.date      :date_paid, null: false
      t.monetize  :amount,    null: false

      t.timestamps
    end
  end
end
