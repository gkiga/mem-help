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
#
require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
