class Dentist < ActiveRecord::Base

  has_secure_password

  has_many :patients

  has_many :assistants

end
