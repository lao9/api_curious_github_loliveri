require 'rails_helper'

describe Commit, type: :model do
  before :each do
    @commit = Commit.new("lao9", "api_curious", stub_user_commits.first)
  end
  it "exists" do
    expect(@commit).to be_a(Commit)
    expect(@commit).to respond_to(:author_name)
    expect(@commit).to respond_to(:author_username)
    expect(@commit).to respond_to(:message)
    expect(@commit).to respond_to(:repo)
    expect(@commit).to respond_to(:format_date)
  end
  it "returns commit author name" do
    expect(@commit.author_name).to eq("Lauren Oliveri")
  end
  it "returns commit full name" do
    expect(@commit.author_username).to eq("lao9")
  end
  it "returns commit message" do
    expect(@commit.message).to eq("Hey there! I'm also commit message.")
  end
  it "returns commit's repository" do
    expect(@commit.repo).to eq("api_curious")
  end
  it "returns formatted commit date" do
    expect(@commit.format_date).to eq("04:28 AM April 20, 2017")
  end
end
