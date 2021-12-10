class User < ApplicationRecord
  has_secure_password

  validates :fullname, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }, presence: true
  validates :address, presence: true
  validates :IdCardNumber, presence: true
  validates :BirthDate, presence: true
  validates :gender, presence: true
  
end
