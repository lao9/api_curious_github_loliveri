require 'rails_helper'

describe GithubService do
  context ".starred_repos" do
    it "returns a collection of a user's starred_repos" do
      VCR.use_cassette("starred_repos") do
        starred_repos = GithubService.starred_repos("lao9")
        starred_repo = starred_repos.first

        expect(starred_repos).to be_an(Array)
        expect(starred_repos.count).to eq(2)
        expect(starred_repo).to be_a(Hash)
        expect(starred_repo).to have_key(:full_name)
        expect(starred_repo).to have_key(:language)
        expect(starred_repo).to have_key(:updated_at)
        expect(starred_repo[:full_name]).to be_a(String)
        expect(starred_repo[:language]).to be_a(String)
        expect(starred_repo[:updated_at]).to be_a(String)
      end
    end
  end
  context ".followers" do
    it "returns collection of a user's followers" do
      VCR.use_cassette("followers") do
        followers = GithubService.followers("lao9")
        follower = followers.first

        expect(followers).to be_an(Array)
        expect(followers.count).to eq(8)
        expect(follower).to be_a(Hash)
        expect(follower).to have_key(:login)
        expect(follower).to have_key(:avatar_url)
        expect(follower[:login]).to be_a(String)
        expect(follower[:avatar_url]).to be_a(String)
      end
    end
  end
  context ".followings" do
    it "returns collection of a user's followings" do
      VCR.use_cassette("followings") do
        followings = GithubService.followings("lao9")
        following = followings.first

        expect(followings).to be_an(Array)
        expect(followings.count).to eq(5)
        expect(following).to be_a(Hash)
        expect(following).to have_key(:login)
        expect(following).to have_key(:avatar_url)
        expect(following[:login]).to be_a(String)
        expect(following[:avatar_url]).to be_a(String)
      end
    end
  end
end
