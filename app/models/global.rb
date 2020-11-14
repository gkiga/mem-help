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
class Global < ApplicationRecord

belongs_to :user
#has_many :global_listings
#has_many :users, :through => :global_listings

has_many :my_notifications, dependent: :destroy
belongs_to :global_listing, optional: true      
    def self.filter(filter)
        if filter and not filter.empty?
            @globals = Global.all
            @globals= @globals.where(sender: filter)
            

            #byebug
            return @globals
        else
            Global.all
        end 
    end
 

end
