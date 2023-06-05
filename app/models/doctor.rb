class Doctor < ApplicationRecord
  SPECIALITIES = %w[Хирург Терапевт Дерматолог Лор].freeze
  has_many :events, dependent: :destroy
  has_many :reports
  has_one :schedule

  validates_presence_of :fio, message: 'ФИО не может быть пустым'
  validates_presence_of :birthday, message: 'Введите дату рождения'
  validates_presence_of :phone_number, message: 'Введите ваш номер телефона'
  validates_presence_of :speciality, message: 'Выберите вашу специальность'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable, :recoverable,
  devise :database_authenticatable, :rememberable, :validatable

  def rating
    reports.average(:note) || 0
  end
end
