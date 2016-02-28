require 'rails_helper'

RSpec.feature 'User can view a completed activity' do
  scenario 'the activity appears on their show page' do
    user = User.create(username: "Lucy", password: 'password')
    activity = Activity.create(title: "Kids who Code", points: 20)
    activity = Activity.create(title: "Make Coffee", points: 10)
    activity = Activity.create(title: "Comb Capybara", points: 30)

    visit root_path
    fill_in "Username", with: "Lucy"
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(page).to have_content("Welcome, #{user.username}!")

    select('Kids who Code', :from => 'user_activity[activity_id]')
    click_on 'Select activity'
    save_and_open_page
    expect(page).to have_content("Kids who Code - 20")
  end
end
