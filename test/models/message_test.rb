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
require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
