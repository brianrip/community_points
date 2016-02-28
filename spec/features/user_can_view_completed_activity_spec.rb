require 'rails_helper'

RSpec.feature 'User can view a completed activity' do
  scenario 'the activity appears on their show page' do
    user = User.create(username: "Allan", password: 'password')
    activity = Activity.create(title: "Kids who Code", points: 20)

    visit root_path
    fill_in "Username", with: "Allan"
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(page).to have_content("Welcome, #{user.username}!")

    # find('#activity').find(:xpath, activity.title).select_option
    click_on 'Select activity'

    expect(page).to have_content("Kids who Code - 20 points")
    expect(page).to have_content("Total Points - 20")
  end
end
