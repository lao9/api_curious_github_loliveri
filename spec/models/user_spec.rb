require 'rails_helper'

RSpec.describe User, type: :model do
  context ".starred_repos(filter)" do
    it "returns colletion of starred repos" do
      stub_omniauth
      user = User.last

      filter = {access_token: user.access_token}
      starred_repos = User.starred_repos(filter)

      expect(starred_repos.count).to eq(2)
      expect(starred_repo.full_name).to eq("lao9/black-thursday-project")
    end
  end
  describe "validations" do
    context "user is valid with all attributes" do
      it { should validate_presence_of(:uid) }
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:image_url) }
    end
  end
end
