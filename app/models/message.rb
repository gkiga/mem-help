# == Schema Information
#
# Table name: messages
#
#  id             :bigint           not null, primary key
#  body           :text
#  recipient_name :string
#  sender_name    :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recipient_id   :integer
#  user_id        :bigint
#
class Message < ApplicationRecord
    validates :body, presence: true
    validates :sender_name, presence: true
    validates :title, presence: true
    validates :recipient_id, presence: true
    validates :recipient_name, presence: true

    has_many :my_notifications, dependent: :destroy
end
    