class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.string :cc
      t.string :area
      t.string :prefix
      t.string :number
      t.string :type
      t.text   :txt_msg

      t.timestamps
    end
  end
end
