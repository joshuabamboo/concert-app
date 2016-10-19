class AddEventsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :events, :text
  end
end
