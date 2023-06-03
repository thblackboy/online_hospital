class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :note, null: false
      t.string :comment
      t.timestamps
    end
    add_reference :reports, :doctor, null: false, foreign_key: true, index: true
    add_reference :reports, :client, null: false, foreign_key: true, index: true
    add_reference :reports, :event, null: false, foreign_key: true, index: true
    add_index :reports, :created_at
  end
end
