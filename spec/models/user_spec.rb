require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :budget }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_uniqueness_of :email }
  end

  context 'associations' do
    it { is_expected.to have_many :expenses }
  end

  context 'instance methods' do
    it 'calculates a users total expense cost' do
      user = create(:user)
      create_list(:expense, 5, user_id: user.id, cost: 100)
      
      result = user.total_expense_cost
        
      expect(result).to eq(500)
    end
  end
end
