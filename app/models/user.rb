class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.search(search)
    where("lower(users.email) LIKE :search ", search: "%#{@parameter}%").uniq
  end

end
