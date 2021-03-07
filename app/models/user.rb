class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:lockable, :timeoutable, :trackable #:confirmable,

  Roles = ["user", "admin"]

  def self.roles
  	Roles
  end

  def authenticatable_salt
    "#{super}#{session_token}"
  end

  def invalidate_session!
    self.update_attribute(:session_token, SecureRandom.hex)
  end

  def std_name
  	return email unless first_name || last_name
 	  (first_name || '') + ' ' + (last_name || '')
  end
end
