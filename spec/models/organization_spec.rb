require 'rails_helper'

describe Organization, type: :model do
  before :each do
    org = stub_organizations.first
    @organization = Organization.new(org)
  end
  it "exists" do
    expect(@organization).to be_an(Organization)
    expect(@organization).to respond_to(:title)
    expect(@organization).to respond_to(:image_url)
  end
  it "returns the organization's title" do
    expect(@organization.title).to eq("Duke-Medical-Instrumentation")
  end
  it "returns the organization's image url" do
    expect(@organization.image_url).to eq("https://avatars2.githubusercontent.com/u/5090472?v=3")
  end
end
