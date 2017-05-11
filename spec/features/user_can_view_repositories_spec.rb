require 'rails_helper'

feature "user's repositories" do
  before :each do
    stub_user_profile

    visit root_path
    click_link "Sign in with Github"
  end
  context "starting on basic profile" do
    scenario "user can navigate to repo list" do
      click_link "Repos: 11"

      expect(current_path).to eq(repos_path)
    end
  end
  context "starting on starred repo path" do
    scenario "user can view all their starred repos" do
      visit repos_path

      within(".repo_0") do
        expect(page).to have_content("lao9/homework")
        expect(page).to have_content("Ruby")
      end

      within(".repo_10") do
        expect(page).to have_content("lao9/portfolios")
        expect(page).to have_content("HTML")
        expect(page).to have_content("Turing School promotion portfolios")
      end

      expect(page).to_not have_css(".repo_11")
    end
  end
end
