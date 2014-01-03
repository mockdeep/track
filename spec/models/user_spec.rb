require 'spec_helper'

describe User do
  describe '.authenticate' do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    context "when given valid credentials" do
      it "returns an instance of user" do
        expect(User.authenticate(@user.email, @user.password)).to eq @user
      end
    end

    context "when given invalid password" do
      it "returns false" do
        expect(User.authenticate(@user.email, "bad password")).to be_false
      end
    end

    context "when given invalid email" do
      it "returns false" do
        expect(User.authenticate("bad email", @user.password)).to be_false
      end
    end
  end

  describe '#items' do
    it { should have_many :items }
  end

  describe '#valid?' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end
end
