class Event < ApplicationRecord
  belongs_to :admin_user

  has_many :enrollments
  has_many :students, through: :enrollments

  validates_presence_of :name, :career, :description, :location, :start_date, :end_date
  
  scope :by_newest, lambda {
    order('created_at DESC')
  }

  scope :by_name, lambda { |value|
    where('name LIKE ?', "%#{value}%")
  }

  scope :by_career, lambda { |value|
    where('career LIKE ?', "%#{value}%")
  }

  default_scope { by_newest }

  def get_transformed_image(transformation)
    if cover
      img_parts = cover.split('upload')
      img_parts[0] + '/upload/q_auto,f_auto,' + transformation + ',' + img_parts[1]
    else
      'https://via.placeholder.com/150?text=sin imagen'
    end
  end
end
