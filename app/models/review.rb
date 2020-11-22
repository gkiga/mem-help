# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  comment     :text
#  rating      :integer
#  sender_name :string
#  vkey        :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
class Review < ApplicationRecord
#Allows for users to review teachers upon request closure and review posted videos
    belongs_to :user, optional: true
    belongs_to :video, optional: true
    has_many :my_notifications, dependent: :destroy
    
  end    


