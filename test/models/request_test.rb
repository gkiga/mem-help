# == Schema Information
#
# Table name: requests
#
#  id                 :bigint           not null, primary key
#  acceptedFlag       :boolean
#  category           :string
#  completedFlag      :boolean
#  description        :string
#  learningPreference :string
#  recipient          :string
#  sender             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "fixtures are valid" do
    requests.each do |q|
      assert q.valid?, q.errors.full_messages.inspect
    end
end
test "description presence not valid" do
  q = requests(:one)
  q.description= nil
  assert_not q.valid?
  q.description = ""
  assert_not q.valid?
end
test "category presence not valid" do
  q = requests(:one)
  q.category= nil
  assert_not q.valid?
  q.category = ""
  assert_not q.valid?
end
test "learningPreference presence not valid" do
  q = requests(:one)
  q.learningPreference= nil
  assert_not q.valid?
  q.learningPreference = ""
  assert_not q.valid?
end
test "recipient presence not valid" do
  q = requests(:one)
  q.recipient= nil
  assert_not q.valid?
  q.recipient = ""
  assert_not q.valid?
end
test "sender presence not valid" do
  q = requests(:one)
  q.sender= nil
  assert_not q.valid?
  q.sender = ""
  assert_not q.valid?
end
#test "acceptedFlag presence not valid" do
 # q = requests(:one)
  #q.acceptedFlag= nil
  #assert_not q.valid?
  #q.acceptedFlag = ""
  #assert_not q.valid?
#end
#test "completedFlag presence not valid" do
 # q = requests(:one)
  #q.completedFlag= nil
  #assert_not q.valid?
  #q.completedFlag = ""
  #assert_not q.valid?
#end
end
