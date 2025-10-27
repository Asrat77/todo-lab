require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
  expect(create(:user)).to be_valid
  end

  it "validates name cannot be nil" do
    user = build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it "validates email cannot be nil" do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "validates email is unique" do
    user = create(:user)
    user2 = build(:user, email: user.email)
    expect(user2).not_to be_valid
  end

  it "validates password cannot be nil" do
    user = build(:user, password: nil)
    expect(user).not_to be_valid
  end
end
