class Event < ApplicationRecord
  belongs_to :admin_user

  has_many :enrollments
  has_many :students, through: :enrollments
end
