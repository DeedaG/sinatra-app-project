class Patient < ActiveRecord::Base

  belongs_to :dentist
  validates :name, :presence => true

end
