class Event < ApplicationRecord
  belongs_to :admin_user

  has_many :enrollments
  has_many :students, through: :enrollments

  def get_index_image
    if cover
      img_parts = cover.split('upload')
      img_parts[0] + '/upload/w_200,h_150,q_auto,f_auto' + img_parts[1]
    else
      'https://via.placeholder.com/150?text=sin imagen'
    end
  end
end
