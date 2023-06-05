class Report < ApplicationRecord
  belongs_to :doctor
  belongs_to :client
  belongs_to :event

  validates :doctor_id, presence: true
  validates :client_id, presence: true
  validates :event_id, presence: true
  validates :note, numericality: { greater_than: 0, less_than: 6, message: 'Оценка должна быть цифрой'}
  validates_presence_of :note, message: 'Выберите оценку приема'

  before_validation :load_data_from_event

  private

  def load_data_from_event
    return unless event

    self.client_id = event.client_id
    self.doctor_id = event.doctor_id
  end
end
