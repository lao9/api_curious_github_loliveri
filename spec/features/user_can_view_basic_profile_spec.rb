require 'rails_helper'

feature "user basic profile" do
  before :each do
    stub_omniauth

    allow_any_instance_of(GithubService)
      .to receive(:starred_repos)
      .and_return(stub_star_repos)

    allow_any_instance_of(GithubService)
      .to receive(:followers)
      .and_return(stub_github_user_collection)

    allow_any_instance_of(GithubService)
      .to receive(:followings)
      .and_return(stub_github_user_collection)

    visit root_path
    click_link "Sign in with Github"

    @user = User.last
  end
  it "returns account info like username and email" do
    within(".account_info") do
      within("h3") do
        expect(page).to have_content("Account Info:")
      end
      expect(page).to have_content("username: #{@user.username}")
      expect(page).to have_content("email: #{@user.email}")
    end
  end
  it "returns profile image" do
    within(".avatar") do
      expect(page).to have_css("img[src*='#{@user.image_url}']")
    end
  end
  it "returns number of starred repos, followers, following" do
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
