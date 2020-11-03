class AddReviewFkColToMyNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_notifications, :review, foreign_key: true
  end
end
