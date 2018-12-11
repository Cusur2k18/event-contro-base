class AdminUser < ApplicationRecord
  has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable



  def is_super_admin
    super_admin ? 'Super adminisrador' : 'Usuario regular'
  end

end
