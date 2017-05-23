class User < ApplicationRecord

  has_secure_password

  validates :name, :email, :budget, :password, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_many :expenses

end
