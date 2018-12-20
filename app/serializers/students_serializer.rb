class StudentsSerializer < ActiveModel::Serializer
  attributes :student_code, :career, :grade, :email, :name
end
