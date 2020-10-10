class CreatePersonEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :person_emails do |t|
      t.integer  :person_id, null: false
      t.integer  :email_id,  null: false
      t.string   :locn
      t.string   :preferred, default: "No"

      t.timestamps
    end
  end
end
