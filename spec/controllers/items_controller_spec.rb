require 'spec_helper'

describe ItemsController do
  let(:item) { create(:item) }
  let(:user) { item.user }

  before :each do
    session[:user_id] = user.id
  end

  describe '#index' do
    before :each do
      get(:index)
    end

    it 'assigns an array of the current user\'s items' do
      assigns(:items).should eq [item]
    end
  end

  describe '#new' do
    it 'assigns a new item' do
      get(:new)
      assigns(:item).should be_new_record
    end
  end

  describe '#create' do
    it 'creates a new item' do
      expect {
        post(:create, :item => { :name => 'blah' })
      }.to change(Item, :count).by(1)
    end
  end

  describe '#edit' do
    before :each do
      get(:edit, :id => item.id)
    end

    it 'finds the given item' do
      assigns(:item).should eq item
    end
  end

  describe '#update' do
    it 'updates the item' do
      put(:update, :id => item.id, :item => {
        :name => 'something',
      })
      item.reload.name.should eq 'something'
    end
  end

  describe '#destroy' do
    it 'should destroy the item' do
      delete(:destroy, :id => item.id)
      Item.find_by_id(item.id).should be_nil
    end
  end
end
