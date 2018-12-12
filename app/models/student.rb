class Student < ApplicationRecord
  has_many :enrollments
  has_many :events, through: :enrollments
end
