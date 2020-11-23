# == Schema Information
#
# Table name: global_listings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GlobalListing < ApplicationRecord
# A model whose sole purpose is to provide a personal index for users to see their global requests
    has_many :globals
end
