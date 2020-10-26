class AddRequestFkColToMyNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_notifications, :request, foreign_key: true
  end
end
