require 'rails_helper'

RSpec.feature "Admin creates a new user" do
  scenario "they can see the new user in the users index" do
    admin = User.create(username: "Scott", password: "password", role: 1)

    visit "/"

    fill_in "Username", with: "Scott"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content "Welcome Admin"

    click_on "Create User"

    fill_in "Username", with: "Brian"
    fill_in "Password", with: "password"
    click_on "Create"

    expect(page).to have_content "Welcome Admin"

    within(:css, "#students") do
      expect(page).to have_content "Brian"
    end
  end

  scenario 'they see multiple users in index' do
    admin = User.create(username: "Brian", password: 'password', role: 1)

    user1 = User.create(username: "Scott", password: 'password')
    user2 = User.create(username: "Thanks", password: 'password')

    visit "/"
    fill_in "Username", with: "Brian"
    fill_in "Password", with: "password"
    click_on "Login"

    within(:css, "#students") do
      expect(page).to have_content "Scott"
      expect(page).to have_content "Thanks"
      expect(page).to_not have_content "Brian"
    end
  end
end
