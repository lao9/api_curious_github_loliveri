require 'rails_helper'

feature "user's followers" do
  before :each do
    stub_user_profile

    visit root_path
    click_link "Sign in with Github"
  end
  context "starting on basic profile" do
    scenario "user can navigate to follower list" do
      click_link "Followers: 3"

      expect(current_path).to eq(followers_path)
    end
  end
  context "starting on followers path" do
    scenario "user can view all their followers" do
      visit followers_path

      within(".user_1") do
        expect(page).to have_content("maxjacobson")
        expect(page).to have_css("img[src*='#{stub_github_user[:avatar_url]}']")
      end

      expect(page).to_not have_css(".user_3")
    end
  end
end
