class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.string :cc, default: "1"
      t.string :area,   null: false
      t.string :prefix, null: false
      t.string :number, null: false
      t.text   :txt_msg

      t.timestamps
    end
  end
end
