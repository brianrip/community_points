require 'rails_helper'

RSpec.feature 'User can redeem rewards' do
  scenario 'user can see redeemed reward on their user page' do
    user = User.create(username: "Daphy", password: "password", points: 100)
    reward = Reward.create(name: "Dance with Jorge",
                           description: "the dance, the YMCA, with the Jorge",
                           point_cost: 75)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on "Redeem Reward"
    click_on "Dance with Jorge"
    click_on "Claim Reward"

    expect(page).to have_content("Dance with Jorge")
    expect(page).to have_content("Total Points - 25")
  end
end
