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
#  user_id             :bigint
#
class Global < ApplicationRecord

belongs_to :user

has_many :my_notifications, dependent: :destroy
         
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
