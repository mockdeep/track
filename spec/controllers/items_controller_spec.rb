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
      expect(assigns(:items)).to eq [item]
    end
  end

  describe '#new' do
    it 'assigns a new item' do
      get(:new)
      expect(assigns(:item)).to be_new_record
    end
  end

  describe '#create' do
    it 'creates a new item' do
      expect do
        post(:create, item: { name: 'blah' })
      end.to change(Item, :count).by(1)
    end
  end

  describe '#edit' do
    before :each do
      get(:edit, id: item.id)
    end

    it 'finds the given item' do
      expect(assigns(:item)).to eq item
    end
  end

  describe '#update' do
    it 'updates the item' do
      put(:update, id: item.id, item: {
        name: 'something',
      })
      expect(item.reload.name).to eq 'something'
    end
  end

  describe '#destroy' do
    it 'should destroy the item' do
      delete(:destroy, id: item.id)
      expect(Item.find_by_id(item.id)).to be_nil
    end
  end
end
