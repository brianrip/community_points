require 'rails_helper'

RSpec.feature 'Admin can delete a reward' do
  scenario 'the reward is no longer readable' do
    admin = User.create(username: "Reginald", password: 'password', role: 1)
    reward = Reward.create(name: "Pizza Party",
                           description: "Pizza time",
                           point_cost: 100)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    within(:css, '#rewards') do
      click_on 'Delete'
    end

    expect(page).to_not have_content("Pizza Party")
  end
end
