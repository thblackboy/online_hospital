class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.text :schedule, null: false
      t.timestamps
    end
    add_reference :schedules, :doctor, null: false, foreign_key: true, index: true
  end
end
