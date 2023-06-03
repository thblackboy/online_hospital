class Event < ApplicationRecord
  belongs_to :doctor
  belongs_to :client
  validates :event_data, presence: true
  validates :event_time, presence: true
  validates :doctor_id, presence: true
  validates :client_id, presence: true
end
