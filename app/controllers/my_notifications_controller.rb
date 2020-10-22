class MyNotificationsController < ApplicationController
    before_action :authenticate_user!


    def index
        @my_notifications = MyNotification.where(recipient: current_user).unread 
    end

    def mark_as_read
        @my_notifications = MyNotification.where(recipient: current_user).unread
        @my_notifications.update_all(read_at: Time.zone.now)
        render json: {success: true}
    end

end