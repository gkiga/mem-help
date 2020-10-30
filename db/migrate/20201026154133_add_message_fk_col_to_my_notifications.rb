class AddMessageFkColToMyNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_notifications, :message, foreign_key: true
  end
end
