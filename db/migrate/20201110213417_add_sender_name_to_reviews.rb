class AddSenderNameToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :sender_name, :string
  end
end
