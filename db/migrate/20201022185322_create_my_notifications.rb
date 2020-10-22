class CreateMyNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :my_notifications do |t|
      t.integer :recipient_id
      t.integer :actor_id
      t.datetime :read_at
      t.string :action
      t.string :notifiable_id
      t.string :notifiable_type

      t.timestamps
    end
  end
end
