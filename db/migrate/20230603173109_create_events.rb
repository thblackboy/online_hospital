class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :event_data, null: false
      t.time :event_time, null: false
      t.boolean :is_done, null: false, default: false
      t.boolean :is_canceled, null: false, default: false
      t.timestamps
    end
    add_reference :events, :client, null: false, foreign_key: true, index: true
    add_reference :events, :doctor, null: false, foreign_key: true, index: true
  end
end
