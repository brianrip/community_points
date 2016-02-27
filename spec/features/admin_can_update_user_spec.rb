require 'rails_helper'

RSpec.feature 'Admin can update a user' do
  scenario 'they see the updated user info' do
    admin = User.create(username: "Scott", password: 'password', role: 1)
    user = User.create(username: 'old_name', password: 'password')

    visit root_path

    fill_in 'Username', with: "Scott"
    fill_in 'Password', with: 'password'
    click_on 'Login'

    click_on 'Edit'

    fill_in 'Username', with: 'new_name'
    fill_in 'Password', with: 'password'
    click_on 'Update User'

    expect(page).to have_content("Welcome Admin")
    within(:css, '#students') do
      expect(page).to have_content("new_name")
      expect(page).to_not have_content("old_name")
    end
  end
end
