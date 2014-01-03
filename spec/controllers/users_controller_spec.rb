require 'spec_helper'

describe UsersController do
  render_views

  describe '#new' do
    before :each do
      get(:new)
      @user = assigns(:user)
    end

    it 'initializes an instance of User' do
      expect(@user).to be_instance_of User
    end

    it "doesn't save the user record" do
      expect(@user).to be_new_record
    end
  end

  describe '#create' do
    before :each do
      @valid_params = {
        :email => 'b@b.com',
        :password => 'b',
        :password_confirmation => 'b',
      }
    end

    context 'given valid params' do
      before :each do
        post(:create, :user => @valid_params)
      end

      it 'flashes a success message' do
        expect(flash[:notice]).to eq 'Signed up!'
      end

      it 'creates a new user' do
        user = assigns(:user)
        expect(user.email).to eq 'b@b.com'
      end

      it "logs the user in" do
        expect(controller.send(:current_user)).to eq assigns(:user)
      end
    end

    context 'given an invalid email' do
      before :each do
        post(:create, :user => @valid_params.merge(:password => 'c'))
      end

      it 'flashes an error' do
        expect(flash.now[:error]).to match /problem creating your account/
      end

      it 'renders the new template' do
        expect(response).to render_template('users/new')
      end
    end
  end
end
