# == Schema Information
#
# Table name: requests
#
#  id                  :bigint           not null, primary key
#  acceptedFlag        :boolean
#  category            :string
#  completedFlag       :boolean
#  description         :string
#  learningPreference  :string
#  new_volunteer_hours :float
#  recipient           :integer
#  recipient_name      :string
#  sender              :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Request < ApplicationRecord

    validates :description, presence: true
    validates :category, presence: true
    validates :learningPreference, presence: true
    validates :recipient, presence: true
    validates :sender, presence: true
    
    belongs_to :user

    has_many :my_notifications, dependent: :destroy
     
  end  


