require 'rails_helper'

RSpec.feature 'User with expenses' do
  scenario 'deletes an expense successfully' do
    user    = create(:user)
    expense = create(:expense)
    user.expenses << expense

    page.set_rack_session(user_id: user.id)

    expect(user.expenses.count).to eq(1)
    visit dashboard_path
    
    click_on "Remove"

    expect(current_path).to eq(dashboard_path)
    expect(user.expenses.count).to eq(0)
  end
end