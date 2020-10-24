class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.integer  :person_id, null: false
      t.string   :addr, null: false
      t.string   :locn
      t.string   :preferred, default: "No"
      t.text     :note

      t.timestamps
    end
  end
end
