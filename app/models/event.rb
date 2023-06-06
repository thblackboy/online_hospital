class Event < ApplicationRecord
  belongs_to :doctor
  belongs_to :client
  has_one :report
  validates :start_time, presence: true,
                         uniqueness: { scope: %i[doctor_id], message: 'К сожалению выбранное вами время уже занято' }
  validate do
    errors.add(:start_time, 'К сожалению выбранное вами время уже занято') if Event.active
                                                                                   .where(doctor_id:, start_time:).any? && new_record?
  end
  validates :doctor_id, presence: true
  validates :client_id, presence: true

  scope :active, -> { where(is_canceled: false, is_done: false) }
  scope :today, lambda {
                  where('events.start_time BETWEEN :from AND :to', from: Time.current.beginning_of_day, to: Time.current.end_of_day)
                }

  def can_do_report?
    report.blank? && updated_at > 2.days.ago
  end
end
