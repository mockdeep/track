require 'spec_helper'

describe TracesController do
  let(:trace) { create(:trace) }
  let(:item) { trace.item }
  let(:user) { item.user }

  before(:each) do
    session[:user_id] = user.id
  end

  describe '#index' do
    before :each do
      create(:trace)
      get(:index, :item_id => item.id)
    end

    it 'assigns an array of the current user\'s traces' do
      assigns(:traces).should eq [trace]
    end

    it 'assigns the given item' do
      assigns(:item).should eq item
    end
  end

  describe '#new' do
    it 'assigns a new trace associated with the given item' do
      get(:new, :item_id => item.id)
      assigns(:trace).should be_new_record
      assigns(:trace).item.should eq item
    end
  end

  describe '#create' do
    it 'creates a new trace associated with a given item' do
      expect {
        post(:create, :item_id => item.id, :trace => {
          :count => 5,
          :executed_on => Time.now,
        })
      }.to change(item.traces, :count).by(1)
    end
  end

  describe '#edit' do
    before :each do
      get(:edit, :item_id => item.id, :id => trace.id)
    end

    it 'finds the given trace' do
      assigns(:trace).should eq trace
    end

    it 'finds the given item' do
      assigns(:item).should eq item
    end
  end

  describe '#update' do
    it 'updates the trace associated with the given item' do
      put(:update, :item_id => item.id, :id => trace.id, :trace => {
        :count => 5,
        :executed_on => Time.now,
      })
      trace.reload.count.should eq 5
    end
  end

  describe '#destroy' do
    it 'should destroy the trace associated with the given item' do
      delete(:destroy, :item_id => item.id, :id => trace.id)
      Trace.find_by_id(trace.id).should be_nil
    end
  end

end
