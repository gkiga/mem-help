# == Schema Information
#
# Table name: global_listings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GlobalListing < ApplicationRecord

    #belongs_to :user
    #belongs_to :global
    has_many :globals
end
