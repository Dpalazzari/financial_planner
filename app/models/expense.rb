class Expense < ApplicationRecord
  belongs_to :user

  validates :cost, :due_date, :details, presence: true
end
