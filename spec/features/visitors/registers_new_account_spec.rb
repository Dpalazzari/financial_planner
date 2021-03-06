require 'rails_helper'

RSpec.feature 'Visitor Registration' do
  context 'Successful Login' do
    it "can register a new user with proper credentials" do
      visit new_user_path
      within('form') do
        fill_in "user[name]", with: 'Drew'
        fill_in "user[email]", with: 'drew@email.com'
        fill_in "user[budget]", with: '1000'
        fill_in "user[password]", with: 'password'
        fill_in "user[password_confirmation]", with: 'password'
        click_on 'Register'
      end

      expect(page).to have_content("Successfully Registered Drew!")
    end
  end

  context 'Unsuccessful Login' do
    it "redirects back to the register user form" do
      visit new_user_path
      within('form') do
        fill_in "user[name]", with: 'Drew'
        fill_in "user[email]", with: 'drew@email.com'
        fill_in "user[budget]", with: '1000'
        fill_in "user[password]", with: 'password'
        click_on 'Register'
      end

      within('form') do
        expect(page).to have_content("can't be blank")
      end

      expect(page).to have_content("Please make sure all fields are correctly filled out.")
    end
  end
end
