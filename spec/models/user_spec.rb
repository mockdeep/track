require 'spec_helper'

describe User do
  describe '.authenticate' do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    context "when given valid credentials" do
      it "returns an instance of user" do
        User.authenticate(@user.email, @user.password).should == @user
      end
    end

    context "when given invalid password" do
      it "returns false" do
        User.authenticate(@user.email, "bad password").should be_false
      end
    end

    context "when given invalid email" do
      it "returns false" do
        User.authenticate("bad email", @user.password).should be_false
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
