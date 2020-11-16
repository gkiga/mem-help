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