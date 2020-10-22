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
require 'test_helper'

class MyNotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
