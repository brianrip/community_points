require 'rails_helper'

RSpec.feature 'admin can create and view activities' do
  scenario 'admin can view list of created activities' do
    admin = User.create(username: "Scott", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    click_on "Create Activity"

    fill_in "Title", with: "Flush toilet"
    fill_in "Points", with: 5
    click_on "Create"


    within(:css, "#activities") do
      expect(page).to have_content "Flush toilet - 5 points"
    end
  end
end
