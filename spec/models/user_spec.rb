require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      username: 'jianyang@SiliconValley.com', password: 'notahotdog')
  end

  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:password)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe "reset_session_token" do
    it "should reset the session token" do
      old_session_token = user.session_token
      user.reset_session_token
      expect(old_session_token).not_to eq(user.session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    it "should return user if found" do
      expect(User.find_by_credentials('jianyang@SiliconValley.com', 'notahotdog')).to eq(user)
    end

    it "should return nil if user not found" do
      expect(User.find_by_credentials('jianyang@SiliconValley.com', 'piedpiper')).to eq(nil)
    end
  end
end
