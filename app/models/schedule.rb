class Schedule < ApplicationRecord
  DAYS = %w[Вс Пн Вт Ср Чт Пт Сб].freeze

  belongs_to :doctor

  validates :doctor_id, presence: true
  validates :schedule, presence: true

  serialize :schedule, JSON

  def available_dates
    work_datetimes = []
    start_date = Date.tomorrow.beginning_of_day
    end_date = start_date.end_of_day + 2.weeks
    existed_dates = doctor.events.active.where('events.start_time BETWEEN :from AND :to', from: start_date,
                                                                                          to: end_date).pluck(:start_time)
    (start_date.to_date..end_date.to_date).each do |date|
      week_day = date.wday
      parsed_times = schedule[week_day.to_s]&.map do |time|
        temp_time = time.to_time
        date.to_time.change(hour: temp_time.hour, min: temp_time.min, sec: 0)
      end
      work_datetimes += parsed_times.presence || []
    end

    work_datetimes - existed_dates
  end
end
