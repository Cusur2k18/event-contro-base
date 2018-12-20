class EventSerializer < ActiveModel::Serializer
  attributes :uuid, :name, :career, :description, :location, :start_date, :end_date, :open_to_enroll, :available_spots, :cover
  has_many :enrollments
end
