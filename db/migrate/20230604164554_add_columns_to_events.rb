class AddColumnsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :start_time, :datetime, null: false
    remove_column :events, :event_data
    remove_column :events, :event_time
  end
end
