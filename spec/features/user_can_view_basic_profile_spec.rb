require 'rails_helper'

# View basic information about my account (profile pic, number of starred repos, followers, following)


feature "user basic profile" do
  before :each do
    stub_omniauth
    @user = User.last

    visit root_path
    click_link "Sign in with Github"
  end
  it "returns account info like username and email" do
    within(".account_info") do
      expect(page).to have_content("username: #{@user.username}")
      expect(page).to have_content("email: #{@user.email}")
    end
  end
  it "returns profile image" do
    expect(page).to have_css(@user.image_url)
  end
  it "returns number of starred repos, followers, following" do
    # within(".addl_info") do
    #   within("h3") do
    #     expect(page).to have_content("Account Status")
    #   end
    #   expect(page).to have_link("#{@user.username}")
    #   expect(page).to have_content("email: #{@user.email}")
    # end
  end
  it "returns links to collections of starred repos, followers, following" do

  end
end
