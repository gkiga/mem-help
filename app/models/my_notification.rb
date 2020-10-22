# == Schema Information
#
# Table name: my_notifications
#
#  id              :bigint           not null, primary key
#  action          :string
#  notifiable_type :string
#  read_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  actor_id        :integer
#  notifiable_id   :string
#  recipient_id    :integer
#
class MyNotification < ApplicationRecord
    belongs_to :recipient, class_name: "User"
    belongs_to :actor, class_name: "User"
    belongs_to :notifiable, polymorphic: true

    scope :unread, -> {where(read_at: nil)}
end
