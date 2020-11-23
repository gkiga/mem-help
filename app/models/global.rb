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
#model for global requests, that is, requests made to the community and accepted by an unknown community user
#as opposed to request model, where a user makes a direct request to a particular user
belongs_to :user

has_many :my_notifications, dependent: :destroy
belongs_to :global_listing, optional: true  
#setting filter for sender name    
    def self.filter(filter)
        if filter and not filter.empty?
            @globals = Global.all
            @globals= @globals.where(sender: filter)
            

            
            return @globals
        else
            Global.all
        end 
    end
 

end
