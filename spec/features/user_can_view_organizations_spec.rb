require 'rails_helper'

feature "see user's organizations" do
  context "on basic profile" do
    scenario "user can view list of their organizations" do
      stub_user_profile
      visit root_path
      click_link "Sign in with Github"

      within(".orgs") do
        within("h3") do
          expect(page).to have_content("Organizations:")
        end
        expect(page).to have_content("#{stub_organizations.first[:login]}")
        expect(page).to have_css("img[src*='#{stub_organizations.first[:avatar_url]}']")
      end

    end
  end
end
