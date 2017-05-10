require 'rails_helper'

describe GithubUser, type: :model do
  before :each do
    @github_user = GithubUser.new(stub_github_user)
  end
  it "exists" do
    expect(@github_user).to be_a(GithubUser)
    expect(@github_user).to respond_to(:username)
    expect(@github_user).to respond_to(:image_url)
  end
  it "returns github username" do
    expect(@github_user.username).to eq("maxjacobson")
  end
  it "returns github user avatar url" do
    expect(@github_user.image_url).to eq("https://avatars2.githubusercontent.com/u/1421211?v=3")
  end
end
