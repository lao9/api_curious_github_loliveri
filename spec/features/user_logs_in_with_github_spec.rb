require 'rails_helper'

feature "user logs in with github" do
  scenario "allows user to login." do

    stub_user_profile

    visit root_path

    expect(page.status_code).to eq(200)
    click_link "Sign in with Github"
    expect(current_path).to eq(user_path)
    expect(page).to have_content("Hello, Lauren Oliveri!")
    expect(page).to have_link("Logout")
    expect(page).to have_link("Lauren Oliveri")
    expect(page).to_not have_link("Sign in with Github")
  end
end
