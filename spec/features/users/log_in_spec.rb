require 'rails_helper'

RSpec.feature 'User' do

  before(:each) do
    @user = create(:user)
  end
  
  context 'successfully logs in' do
    it 'directs the user to the dashboard page' do
      visit login_path

      expect(page).to have_link("Login")
      expect(page).to_not have_link("Logout")

      within("form") do
        fill_in "email", with: @user.email
        fill_in "password", with: @user.password
        click_on "Login"
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{@user.name}.")
      expect(page).to_not have_link("Login")
      expect(page).to have_content("Logout")
    end
  end

  context 'unsuccessfully logs in' do
    it "redirects to the login path" do
      visit login_path

      within('form') do
        fill_in "email", with: @user.email
        fill_in "password", with: 'big babooshkas'
        click_on "Login"
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Login Failed.")
    end
  end

  context 'logs out' do
    it 'logs the user out' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_path
      click_on 'Logout'
      expect(page).to have_content("Successfully Logged Out.")
      expect(current_path).to eq(login_path)
    end
  end
end
