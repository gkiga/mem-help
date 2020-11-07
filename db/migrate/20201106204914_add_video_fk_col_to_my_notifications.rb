class AddVideoFkColToMyNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_notifications, :video, foreign_key: true
  end
end
