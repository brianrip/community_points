require 'rails_helper'

RSpec.feature 'admin can delete an activity' do
  scenario 'admin sees list of activities without deleted activity' do

    admin = User.create(username: "Scott", password: "password", role: 1)
    delete_activity = Activity.create(title: "Make Coffee", points: 50)
    keep_activity = Activity.create(title: "Lightning Talk", points: 20)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_users_path

    expect(page).to have_content "Lightning Talk"
    expect(page).to have_content "Make Coffee"

    first(:link, "Delete").click

    expect(page).to have_content "Lightning Talk"
    expect(page).to_not have_content "Make Coffee"
  end
end
