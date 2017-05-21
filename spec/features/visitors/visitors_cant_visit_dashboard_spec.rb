require 'rails_helper'

RSpec.feature "Visitor" do
  it "Can not access the dashboard if unregistered or unauthenticated" do
    visit dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
