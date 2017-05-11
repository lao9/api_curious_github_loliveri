require 'rails_helper'

describe Repository, type: :model do
  before :each do
    @repository = Repository.new(stub_repository)
  end
  it "exists" do
    expect(@repository).to be_a(Repository)
    expect(@repository).to respond_to(:full_name)
    expect(@repository).to respond_to(:language)
    expect(@repository).to respond_to(:description)
    expect(@repository).to respond_to(:format_date)
    expect(@repository).to_not respond_to(:updated_at)
  end
  it "returns repository full name" do
    expect(@repository.full_name).to eq("lao9/black-thursday-project")
  end
  it "returns repository language" do
    expect(@repository.language).to eq("Ruby")
  end
  it "returns repository description" do
    expect(@repository.description).to eq("Turing School promotion portfolios")
  end
  it "returns formatted repository date" do
    expect(@repository.format_date).to eq("2 days") | eq("about 1 day") | eq("1 day")
  end
end
