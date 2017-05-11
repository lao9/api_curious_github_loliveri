require 'rails_helper'

describe GithubService do
  context ".starred_repos" do
    it "returns a collection of a user's starred_repos" do
      VCR.use_cassette("starred_repos") do
        starred_repos = GithubService.starred_repos("lao9", {access_token: ENV['ACCESS_TOKEN']})
        starred_repo = starred_repos.first

        expect(starred_repos).to be_an(Array)
        expect(starred_repos.count).to eq(2)
        expect(starred_repo).to be_a(Hash)
        expect(starred_repo).to have_key(:full_name)
        expect(starred_repo).to have_key(:language)
        expect(starred_repo).to have_key(:description)
        expect(starred_repo).to have_key(:updated_at)
        expect(starred_repo[:full_name]).to be_a(String)
        expect(starred_repo[:language]).to be_a(String) | be_nil
        expect(starred_repo[:description]).to be_a(String) | be_nil
        expect(starred_repo[:updated_at]).to be_a(String)
      end
    end
  end
  context ".followers" do
    it "returns collection of a user's followers" do
      VCR.use_cassette("followers") do
        followers = GithubService.followers("lao9", {access_token: ENV['ACCESS_TOKEN']})
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
        followings = GithubService.followings("lao9", {access_token: ENV['ACCESS_TOKEN']})
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
  context ".repos" do
    it "returns collection of a user's repos" do
      VCR.use_cassette("repos") do
        repos = GithubService.repos("lao9", {access_token: ENV['ACCESS_TOKEN']})
        repo = repos.first

        expect(repos).to be_an(Array)
        expect(repos.count).to eq(30)
        expect(repo).to be_a(Hash)
        expect(repo).to have_key(:full_name)
        expect(repo).to have_key(:language)
        expect(repo).to have_key(:description)
        expect(repo).to have_key(:updated_at)
        expect(repo[:full_name]).to be_a(String)
        expect(repo[:language]).to be_a(String) | be_nil
        expect(repo[:description]).to be_a(String) | be_nil
        expect(repo[:updated_at]).to be_a(String)
      end
    end
  end
  context ".orgs" do
    it "returns collection of a user's organizations" do
      VCR.use_cassette("orgs") do
        orgs = GithubService.orgs("lao9", {access_token: ENV['ACCESS_TOKEN']})
        org = orgs.first

        expect(orgs).to be_an(Array)
        expect(orgs.count).to eq(1)
        expect(org).to be_a(Hash)
        expect(org).to have_key(:login)
        expect(org).to have_key(:avatar_url)
        expect(org[:login]).to be_a(String)
        expect(org[:avatar_url]).to be_a(String)
      end
    end
  end
  context ".commits" do
    it "returns collection of a user's recent commits" do
      VCR.use_cassette("commits") do
        commits = GithubService.commits("lao9", {access_token: ENV['ACCESS_TOKEN']})
        commit = commits.first

        expect(commits).to be_an(Array)
        expect(commit).to be_a(Commit)
        expect(commit).to respond_to(:author_username)
        expect(commit).to respond_to(:author_name)
        expect(commit).to respond_to(:message)
        expect(commit).to respond_to(:repo)
        expect(commit).to respond_to(:created_at)
        expect(commit).to respond_to(:format_date)
      end
    end
  end
  context ".following_commits" do
    it "returns collection of a user's following's recent commits" do
      VCR.use_cassette("following_commits") do
        commits = GithubService.following_commits("lao9", {access_token: ENV['ACCESS_TOKEN']})
        commit = commits.first

        expect(commits).to be_an(Array)
        expect(commit).to be_a(Commit)
        expect(commit).to respond_to(:author_username)
        expect(commit).to respond_to(:author_name)
        expect(commit).to respond_to(:message)
        expect(commit).to respond_to(:repo)
        expect(commit).to respond_to(:created_at)
        expect(commit).to respond_to(:format_date)
      end
    end
  end
end
