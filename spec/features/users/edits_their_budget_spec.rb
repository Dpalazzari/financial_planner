require 'rails_helper'

RSpec.feature 'User with a budget' do
  scenario 'changes their budget' do
    user = create(:user)
    budget = user.budget
    page.set_rack_session(user_id: user.id)
    
    visit dashboard_path
    expect(page).to have_content(budget)

    click_on 'Update Budget'

    fill_in 'user[budget]', with: 2000
    click_on 'Submit'

    user.reload
    
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(2000)
    expect(page).to_not have_content(budget)
    expect(user.budget).to eq(2000)
  end

  scenario 'cannot change another users budget' do
    user1 = create(:user)
    user2 = create(:user)

    page.set_rack_session(user_id: user1.id)

    visit edit_user_path(user2)

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
    expect(page).to_not have_content("Edit Budget")
  end
end