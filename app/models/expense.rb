class Expense < ApplicationRecord
  belongs_to :user

  validates :cost, :details, presence: true
end
