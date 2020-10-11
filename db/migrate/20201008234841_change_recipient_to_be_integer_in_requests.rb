class ChangeRecipientToBeIntegerInRequests < ActiveRecord::Migration[6.0]
  def change 
    change_column :requests, :recipient, 'integer USING CAST(recipient AS integer)'
  end 
end