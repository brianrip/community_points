require 'rails_helper'

RSpec.feature 'admin can cruc activities' do
  scenario 'admin can view list of created activities' do
    admin = User.create(username: "Scott", password: "password", role: 1)

    visit "/"

    fill_in "Username", with: "Scott"
    fill_in "Password", with: "password"
    click_on "Login"

    click_on "Create Activity"

    fill_in "Title", with: "Flush toilet"
    fill_in "Points", with: 5
    click_on "Create"


    within(:css, "#activities") do
      expect(page).to have_content "Flush toilet - 5 points "
    end
  end
end
