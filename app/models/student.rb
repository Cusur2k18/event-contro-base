class Student < ApplicationRecord
  has_many :enrollments
  has_many :events, through: :enrollments

  validates_presence_of :student_code, :name, :career

  def attended(evt)
    @enroll = enrollments.find_by('event_id = ?', evt.id)
    @enroll.attended
  end

end
