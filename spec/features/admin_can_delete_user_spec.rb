require 'rails_helper'

RSpec.feature "admin can delete user" do
  scenario "admin will see dashboard without deleted user present" do

    admin = User.create(username: "Brian", password: "password", role: 1)
    user3 = User.create(username: "Buh Bye", password: "password")
    user1 = User.create(username: "Jack", password: "password")
    user2 = User.create(username: "Nick", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_content "Buh Bye"
    expect(page).to have_content "Jack"
    expect(page).to have_content "Nick"

    first(:link, "Delete").click

    expect(page).to have_content "Jack"
    expect(page).to have_content "Nick"
    expect(page).to_not have_content "Buh Bye"

  end
end
