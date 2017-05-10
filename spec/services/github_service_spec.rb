require 'rails_helper'

describe GithubService do
  attr_reader :service

  before :each do
    stub_omniauth
    @service = GithubService.new
  end

  describe "#starred_repos" do
    it "returns user's starred repos" do
      VCR.use_cassette("services/starred_repos") do
        starred_repos = service.starred_repos
      end
    end
  end


end
