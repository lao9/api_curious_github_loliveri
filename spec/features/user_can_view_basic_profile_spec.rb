require 'rails_helper'

feature "user basic profile" do
  before :each do
    stub_user_profile

    visit root_path
    click_link "Sign in with Github"

    @user = User.last
  end
  scenario "returns account info like username and email" do
    within(".account_info") do
      within("h3") do
        expect(page).to have_content("Account Info:")
      end
      expect(page).to have_content("username: #{@user.username}")
      expect(page).to have_content("email: #{@user.email}")
    end
  end
  scenario "returns profile image" do
    within(".avatar") do
      expect(page).to have_css("img[src*='#{@user.image_url}']")
    end
  end
  scenario "returns number of starred repos, followers, following" do
    within(".addl_info") do
      within("h3") do
        expect(page).to have_content("Account Stats:")
      end
      expect(page).to have_link("Starred Repos: 2")
      expect(page).to have_link("Followers: 3")
      expect(page).to have_link("Following: 3")
    end
  end
end
