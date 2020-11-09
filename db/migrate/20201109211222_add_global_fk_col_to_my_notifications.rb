class AddGlobalFkColToMyNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_notifications, :global, foreign_key: true
  end
end
