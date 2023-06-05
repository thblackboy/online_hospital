class Client < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :reports

  validates_presence_of :fio, message: 'ФИО не может быть пустым'
  validates_presence_of :email, message: 'Поле email не может быть пустым'
  validates_presence_of :password, message: 'Пароль не может быть пустым'
  validates_presence_of :birthday, message: 'Введите дату рождения'
  validates_presence_of :phone_number, message: 'Введите ваш номер телефона'
  validates_uniqueness_of :email, case_sensitive: false, message: 'Email уже занят'
  validates_uniqueness_of :phone_number, case_sensitive: false, message: 'Данный номер уже занят'
  validates_format_of :email, with: Devise.email_regexp, message: 'Неверный формат электронной почты'
  validates_confirmation_of :password, on: :create, message: 'Пароли не совпадают'
  validates_length_of :password, within: Devise.password_length, message: 'Пароль должен быть больше 6 символов'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable
end
