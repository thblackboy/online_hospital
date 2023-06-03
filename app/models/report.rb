class Report < ApplicationRecord
  belongs_to :doctor
  belongs_to :client
  belongs_to :event

  validates :doctor_id, presence: true
  validates :client_id, presence: true
  validates :event_id, presence: true
  validates :note, presence: true, numericality: { greater_than: 0, less_than: 6 }
end
