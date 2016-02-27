require 'rails_helper'

RSpec.feature 'Admin can edit an activity' do
  scenario 'it can see the updated activity' do
    admin = User.create(username: "Scott", password: 'password', role: 1)
    activity = Activity.create(title: "Flush the Toilet", points: 5)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    within(:css, '#activities') do
      click_on 'Edit'
    end

    fill_in "Title", with: 'Mentor someone, punk'
    fill_in "Points", with: '10'
    click_on "Update Activity"

    within(:css, '#activities') do
      expect(page).to have_content("Mentor someone, punk")
      expect(page).to have_content("10")
      expect(page).to_not have_content("Flush the Toilet")
      expect(page).to_not have_content("5")
    end
  end
end
