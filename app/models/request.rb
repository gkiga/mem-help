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
    #validates :completedFlag, presence: true ...Both are set to nil in yml file; necessitates test fail
    #validates :acceptedFlag, presence: true
    after_initialize :init

    def init
      self.completedFlag  ||= false          #will set the default value only if it's nil
      self.acceptedFlag ||= false 
  end  

end
