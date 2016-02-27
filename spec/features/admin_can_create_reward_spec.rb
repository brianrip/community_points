require 'rails_helper'

RSpec.feature 'Admin can create a reward' do
  scenario 'they can see the rewards' do
    admin = User.create(username: "Scott", password: 'password', role: 1)
    names = [1, 2]

    # slack_admin_priv = Reward.create(name: "Slack Admin Privileges",
    #                                  description: "Do anything",
    #                                  point_cost: 1000)
    # pizza_party = Reward.create(name: "Pizza Party with Horace",
    #                             description: "so juicy",
    #                             point_cost: 100)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    click_on "Create Reward"

    fill_in "Name", with: "Pizza Party with Horace"
    fill_in "Description", with: "Pizza forever and ever"
    fill_in "Point cost", with: 100
    click_on "Create Reward"

    within(:css, '#rewards') do
      expect(page).to have_content("Pizza Party with Horace")
    end
  end
end
