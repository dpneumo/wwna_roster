class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :nickname
      t.string :first, null: false
      t.string :middle
      t.string :last,  null: false
      t.string :suffix
      t.string :honorific
      t.text   :note

      t.timestamps
    end
  end
end
