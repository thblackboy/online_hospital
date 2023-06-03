class Schedule < ApplicationRecord
  belongs_to :doctor

  validates :doctor_id, presence: true
  validates :schedule, presence: true

  serialize :schedule, JSON
end
