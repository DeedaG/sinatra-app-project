class Assistant < ActiveRecord::Base

  belongs_to :dentist
  validates_presence_of :dentist
end
