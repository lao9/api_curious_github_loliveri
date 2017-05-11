require 'rails_helper'

feature "user's recent commit" do
  before :each do
    stub_user_profile
    visit root_path
    click_link "Sign in with Github"
  end
  context "from user profile" do
    scenario "user can navigate to the recent commit page" do
      click_link "Your Recent Commits"

      expect(current_path).to eq(user_commits_path)
    end
  end
  context "starting on recent commit page" do
    scenario "user can access their recent commits" do
      visit user_commits_path

      within("h1") do
        expect(page).to have_content("Your Recent Commits")
      end

      within("table") do
        expect(page).to have_content("api_curious")
        expect(page).to have_content("04:28 AM April 20, 2017")
        expect(page).to have_content("Hey there! I'm also commit message.")
        expect(page).to have_content("black_thursday")
        expect(page).to have_content("04:28 AM April 19, 2017")
        expect(page).to have_content("Hey there! I'm a commit message.")
      end
    end
  end
end
