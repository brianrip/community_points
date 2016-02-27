require 'rails_helper'

RSpec.feature 'Admin can update a reward' do
  scenario 'it sees reward with updated points and name' do
    admin = User.create(username: "Scrote", password: "password", role: 1)
    drink_for_free = Reward.create(name: "Drink for free",
                                   description: "at the vault until closing time",
                                   point_cost: 500)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_content "Drink for free"

    click_on "Edit"

    fill_in "Name", with: "One free drink"
    fill_in "Description", with: "at Hapa durring happy hour"
    fill_in "Point cost", with: 100
    click_on "Update Reward"

    expect(page).to have_content "One free drink"
  end
end
