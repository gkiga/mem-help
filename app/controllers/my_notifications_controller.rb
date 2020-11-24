class MyNotificationsController < ApplicationController
    # Notifications are created in the controller of the notifiable model
    # So to add a new notification for reviews, it will have to be created in reviews_controller.rb
    
    before_action :authenticate_user!

    def index
        @my_notifications = MyNotification.where(recipient: current_user).unread 
    end

    def mark_as_read
        @my_notifications = MyNotification.where(recipient: current_user).unread
        @my_notifications.update_all(read_at: Time.zone.now)
        render json: {success: true}
    end

    # DELETE /my_notifications/1
    # DELETE /my_notifications/1.json
    def destroy
        @my_notification = MyNotification.find(params[:id])
        link = @my_notification.actor
        @my_notification.destroy
        respond_to do |format|
            format.html { redirect_back(fallback_location: root_path) }
            format.json { head :no_content }
        end
    end


end