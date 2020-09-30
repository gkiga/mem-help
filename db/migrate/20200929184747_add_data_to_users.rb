class AddDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :contact_info, :string
    add_column :users, :major, :string
    add_column :users, :interests, :string
    add_column :users, :bio, :text
    add_column :users, :teaching_methods, :string
    add_column :users, :volunteer_hours, :float
  end
end
