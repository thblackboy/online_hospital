class AddColumnsToDoctorTable < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :fio, :string, limit: 80, null: false
    add_column :doctors, :phone_number, :string, limit: 20, null: false
    add_column :doctors, :speciality, :string, limit: 80, null: false
    add_column :doctors, :birthday, :date, null: false

    add_index :doctors, :phone_number
  end
end
