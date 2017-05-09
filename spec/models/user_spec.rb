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
end
