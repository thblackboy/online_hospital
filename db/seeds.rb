NAMES = %w[Виктория Евгений Виктор Любовь Павел Александр Дарья].freeze
ABBR = %w[A B O C].freeze
TIMES = ['11:00', '11:30', '12:00', '12:30', '13:00', '14:00', '16:00'].freeze

SCHEDULE = {
  '0' => TIMES,
  '1' => TIMES,
  '2' => TIMES,
  '3' => TIMES,
  '4' => TIMES,
  '5' => TIMES,
  '6' => TIMES
}

def fio
  "#{NAMES.sample}  #{ABBR.sample}"
end

def start_time
  time = TIMES.sample.to_time
  Date.tomorrow.to_time.change(hour: time.hour, min: time.min)
end

doctors = (1..5).map do |n|
  Doctor.create!(email: "doctor#{n}@example.com", password: 'password', password_confirmation: 'password',
                 fio:, birthday: Date.today, speciality: Doctor::SPECIALITIES.sample, phone_number: "711199665#{n}")
end

users = (1..20).map do |n|
  Client.create!(email: "client#{n}@example.com", password: 'password', password_confirmation: 'password',
                 fio:, birthday: n.days.ago, adress: "улица #{fio} дом #{n}", phone_number: "788899665#{n}")
end

doctors.each { |doctor| Schedule.create!(doctor_id: doctor.id, schedule: SCHEDULE) }

users.each { |user| Event.create(client_id: user.id, doctor_id: doctors.sample.id, start_time:) }
