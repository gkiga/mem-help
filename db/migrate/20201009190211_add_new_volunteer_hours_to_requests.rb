class AddNewVolunteerHoursToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :new_volunteer_hours, :float
  end
end
