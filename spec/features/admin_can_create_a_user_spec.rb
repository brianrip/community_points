require 'rails_helper'

RSpec.feature "Admin creates a new user" do
  scenario "they can see the new user in the users index" do
    admin = User.create(username: "Scott", password: "password", role: 1)

    visit "/"
    # user visits root page
    fill_in "Username", with: "Scott"
    fill_in "Password", with: "password"

    click_on "Login"

    expect(page).to have_content "Welcome Admin"
    # user should see the admin dashboard
    click_on "Create User"
    # user click add user
    fill_in "Username", with: "Brian"
    fill_in "Password", with: "password"

    click_on "Create"
    # user clicks create user
    expect(page).to have_content "Welcome Admin"

    within(:css, "#students") do
      expect(page).to have_content "Brian"
    end
    # user sees list of all users including the one just added
  end
end
