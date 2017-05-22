require 'rails_helper'

RSpec.feature 'User' do
  context 'successfully logs in' do
    it 'directs the user to the dashboard page' do
      user = create(:user)

      visit login_path

      expect(page).to have_link("Login")
      expect(page).to_not have_link("Logout")

      within("form") do
        fill_in "email", with: user.email
        fill_in "password", with: user.password
        click_on "Login"
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{user.name}.")
      expect(page).to_not have_link("Login")
      expect(page).to have_content("Logout")
    end
   end
end
