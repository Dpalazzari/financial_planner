require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :cost }
    it { is_expected.to validate_presence_of :due_date }    
    it { is_expected.to validate_presence_of :details }
  end

  context 'associations' do
    it { is_expected.to belong_to :user }
  end
end
