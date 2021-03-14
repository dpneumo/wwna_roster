# config/db/migrate/enable_uuid.rb
class EnableUuid < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
  end
end