# == Schema Information
#
# Table name: globals
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
#  global_listing_id   :bigint
#  user_id             :bigint
#
# Indexes
#
#  index_globals_on_global_listing_id  (global_listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (global_listing_id => global_listings.id)
#
require 'test_helper'

class GlobalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
