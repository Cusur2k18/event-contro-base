class Enrollment < ApplicationRecord
  belongs_to :event
  belongs_to :student

  validates_presence_of :event, :student

end
