class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :address
      t.string :type
      t.text :note

      t.timestamps
    end
  end
end
