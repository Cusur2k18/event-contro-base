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

  scope :by_uuid, lambda { |uuid|
    where('uuid = ?', uuid).first
  }

  scope :by_id, lambda { |id|
    where('id = ?', id).first
  }

  scope :today_events, lambda {
    where('start_date BETWEEN ? AND ?', Time.now.beginning_of_day, Time.now.end_of_day)
  }

  default_scope { by_newest }

  def get_transformed_image(transformation)
    if cover
      img_parts = cover.split('upload')
      img_parts[0] + '/upload/q_auto,f_auto,' + transformation + ',' + img_parts[1]
    else
      ActionController::Base.helpers.asset_path('no-image.png')
    end
  end

  def attendance_list_ready?
    end_date.to_date.past? && students.length > 0
  end
end
