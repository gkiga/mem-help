# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  comment     :text
#  rating      :integer
#  sender_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
class Review < ApplicationRecord
    belongs_to :user

    has_many :my_notifications, dependent: :destroy

end
