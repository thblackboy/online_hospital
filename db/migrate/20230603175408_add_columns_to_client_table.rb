class AddColumnsToClientTable < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :fio, :string, limit: 80, null: false
    add_column :clients, :phone_number, :string, limit: 20, null: false
    add_column :clients, :adress, :string
    add_column :clients, :birthday, :date, null: false

    add_index :clients, :phone_number
  end
end
