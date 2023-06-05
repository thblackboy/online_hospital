class Client < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :reports

  validates_presence_of :fio, message: 'ФИО не может быть пустым'
  validates_presence_of :birthday, message: 'Введите дату рождения'
  validates_presence_of :phone_number, message: 'Введите ваш номер телефона'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
