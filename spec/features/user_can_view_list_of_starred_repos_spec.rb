require 'rails_helper'

feature "user's starred repositories" do
  before :each do
    stub_user_profile

    visit root_path
    click_link "Sign in with Github"
  end
  context "starting on basic profile" do
    scenario "user can navigate to starred repo list" do
      click_link "Starred Repos: 2"

      expect(current_path).to eq(starred_repos_path)
    end
  end
  context "starting on starred repo path" do
    scenario "user can view all their starred repos" do
      visit starred_repos_path

      within(".repo_0") do
        expect(page).to have_content("lao9/black-thursday-project")
        expect(page).to have_content("Ruby")
      end

      within(".repo_1") do
        expect(page).to have_content("lao9/black-thursday-project")
        expect(page).to have_content("Ruby")
      end

      expect(page).to_not have_css(".repo_2")
    end
  end
end
