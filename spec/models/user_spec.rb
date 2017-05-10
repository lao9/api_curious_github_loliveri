require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "user is valid with all attributes" do
      it { should validate_presence_of(:uid) }
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:image_url) }
    end
  end
  context ".starred_repos" do
    it "returns colletion of starred repos" do
      allow_any_instance_of(GithubService)
        .to receive(:starred_repos)
        .and_return(stub_star_repos)
      user = User.from_omniauth(stub_omniauth)
      starred_repos = user.starred_repos
      starred_repo = starred_repos.first

      expect(starred_repos.count).to eq(2)
      expect(starred_repo.full_name).to eq("lao9/black-thursday-project")
    end
  end
  context ".followers" do
    it "returns colletion of followers" do
      allow_any_instance_of(GithubService)
        .to receive(:followers)
        .and_return(stub_github_user_collection)
      user = User.from_omniauth(stub_omniauth)
      followers = user.followers
      follower = followers.first

      expect(followers.count).to eq(3)
      expect(follower.username).to eq("maxjacobson")
    end
  end
  context ".followings" do
    it "returns colletion of followings" do
      allow_any_instance_of(GithubService)
        .to receive(:followings)
        .and_return(stub_github_user_collection)
      user = User.from_omniauth(stub_omniauth)
      followings = user.followings
      following = followings.first

      expect(followings.count).to eq(3)
      expect(following.username).to eq("maxjacobson")
    end
  end
end
