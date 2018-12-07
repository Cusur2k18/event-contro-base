class Enrollment < ApplicationRecord
  belongs_to :event
  belongs_to :student
end
