class User < ApplicationRecord

  has_secure_password

  validates :name, :email, :budget, presence: true
  validates :password, presence: true, :on => :create
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, :on => :create
  validates :email, uniqueness: true

  has_many :expenses

  def total_expense_cost
    expenses.pluck(:cost).inject(:+)
  end

end
