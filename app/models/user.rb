class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:lockable, :timeoutable, :trackable #:confirmable,

  def authenticatable_salt
    "#{super}#{session_token}"
  end

  def invalidate_session!
    self.update_attribute(:session_token, SecureRandom.hex)
  end
end
