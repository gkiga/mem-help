# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :text
#  contact_info           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  interests              :string
#  last_name              :string
#  major                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  teaching_methods       :string
#  volunteer_hours        :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         after_initialize :default_values
    
    def username
    return self.email.split('@')[0].capitalize
    end   
         private
           def default_values
             self.volunteer_hours||= 0.0

           end

 
  has_one_attached :avatar
   after_commit :add_default_avatar, on: %i[create update]
         
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150').processed
    else
      '/No_user.jpg'
    end
  end

  private
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'No_user.jpg'
          )
        ), 
        filename: 'No_user.jpg',
        content_type: 'image/jpg'
      )
    end

   end


  def self.search(search)
    if search
      email = User.find_by(email: search)
      if email
        self.where(user_id: email)
      else
        @users = User.all 
      end
    else
      @users = User.all
    end
  end

  has_many(
    :videos,
    class_name: 'Video',
    foreign_key: 'user_id',
    inverse_of: :creator
  )

  # MyNotifications
  has_many :my_notifications, foreign_key: :recipient_id
 
  # Requests
  has_many :requests

  # Globals
  has_many :globals

  # Reviews
  has_many :reviews, dependent: :destroy

  # Given instance is the followed user
  # Calling "followers" returns the given instance's list of users that follow them
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow" # follows for given user instance
  has_many :followers, through: :received_follows, source: :follower               # users who follow given user intance

  # Given instance is the follower
  # Calling "following" returns the given instance's list of users they follow
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"         # follows a user gave someone else
  has_many :followings, through: :given_follows, source: :followed_user            # other users this user has followed

  
end
