class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }, presence: true
  validates :alamat, presence: true
  validates :no_ktp, presence: true
  validates :tanggal_lahir, presence: true
  validates :jenis_kelamin, presence: true
  
end
