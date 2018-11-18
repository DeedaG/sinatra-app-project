class Dentist < ActiveRecord::Base

  has_secure_password

  has_many :patients

  has_many :assistants

  validates :email,    :presence => true,
                       :uniqueness => true
  validates :password, :presence => true

end
