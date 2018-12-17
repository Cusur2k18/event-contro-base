class Student < ApplicationRecord
  has_many :enrollments
  has_many :events, through: :enrollments

  validates_presence_of :student_code, :name, :career

end
