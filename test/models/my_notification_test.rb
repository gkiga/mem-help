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
#  message_id      :bigint
#  notifiable_id   :string
#  recipient_id    :integer
#  request_id      :bigint
#
# Indexes
#
#  index_my_notifications_on_message_id  (message_id)
#  index_my_notifications_on_request_id  (request_id)
#
# Foreign Keys
#
#  fk_rails_...  (message_id => messages.id)
#  fk_rails_...  (request_id => requests.id)
#
require 'test_helper'

class MyNotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
