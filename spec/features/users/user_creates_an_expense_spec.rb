require 'rails_helper'

RSpec.feature 'User' do
  describe 'user creates an expense' do
    scenario 'creates an expense' do
      user = create(:user)
      page.set_rack_session(user_id: user.id)
      expect(user.expenses.count).to eq(0)

      visit dashboard_path
      
      fill_in 'expense[cost]', with: 200.00
      fill_in 'expense[details]', with: "Bills really stink"
      click_on 'Add Expense'

      expect(user.expenses.count).to eq(1)

      expense = Expense.first

      expect(page).to have_content("Successfully created an expense.")
      expect(page).to have_content(expense.cost)
      expect(page).to have_content(expense.details)   
      expect(current_path).to eq(dashboard_path)   
    end
  end
end