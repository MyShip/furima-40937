class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,               presence: true
  validates :first_name_write,   presence: true
  validates :last_name_write,    presence: true
  validates :first_name_reading, presence: true
  validates :first_name_reading, presence: true
  validates :last_name_reading,  presence: true
  validates :birthday,           presence: true

  has_many  :orders
  has_many  :items
       
end
