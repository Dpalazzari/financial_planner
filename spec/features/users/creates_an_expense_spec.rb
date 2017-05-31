require 'rails_helper'

RSpec.feature 'User' do
  describe 'user creates an expense' do

    before(:each) do
      @user = create(:user)
      page.set_rack_session(user_id: @user.id)
    end

    scenario 'creates an expense' do
      expect(@user.expenses.count).to eq(0)

      visit dashboard_path
      
      fill_in 'expense[cost]', with: 200.00
      fill_in 'expense[due_date]', with: Date.new(2001,2,3.5)
      fill_in 'expense[details]', with: "Bills really stink"
      click_on 'Add Expense'

      expect(@user.expenses.count).to eq(1)

      expense = Expense.first

      expect(page).to have_content("Successfully created an expense.")
      expect(page).to have_content(expense.cost)
      expect(page).to have_content(expense.details)   
      expect(current_path).to eq(dashboard_path)   
    end

    scenario 'fails to fill_in form completely' do
      expect(@user.expenses.count).to eq(0)

      visit dashboard_path
      
      fill_in 'expense[cost]', with: 200.00
      click_on 'Add Expense'

      expect(@user.expenses.count).to eq(0)      
      expect(page).to have_content("Make sure all required fields are filled in.")
    end
  end
end