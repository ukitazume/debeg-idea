require 'spec_helper'

describe Like do

  describe "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:idea) }
  end

  describe "#create_with_user_and_idea" do
    before do
      @user = build(:user)
      @idea = build(:idea)
    end

    it "return created instance" do
      expect(Like.create_with_user_and_idea(@user, @idea).class).to eq(Like)
    end
  end

end
