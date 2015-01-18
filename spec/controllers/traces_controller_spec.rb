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
      get(:index, item_id: item.id)
    end

    it 'assigns an array of the current user\'s traces' do
      expect(assigns(:traces)).to eq [trace]
    end

    it 'assigns the given item' do
      expect(assigns(:item)).to eq item
    end
  end

  describe '#new' do
    it 'assigns a new trace associated with the given item' do
      get(:new, item_id: item.id)
      expect(assigns(:trace)).to be_new_record
      expect(assigns(:trace).item).to eq item
    end
  end

  describe '#create' do
    it 'creates a new trace associated with a given item' do
      expect do
        post(:create, item_id: item.id, trace: {
          count: 5,
          executed_on: Time.now,
        })
      end.to change(item.traces, :count).by(1)
    end
  end

  describe '#edit' do
    before :each do
      get(:edit, item_id: item.id, id: trace.id)
    end

    it 'finds the given trace' do
      expect(assigns(:trace)).to eq trace
    end

    it 'finds the given item' do
      expect(assigns(:item)).to eq item
    end
  end

  describe '#update' do
    it 'updates the trace associated with the given item' do
      put(:update, item_id: item.id, id: trace.id, trace: {
        count: 5,
        executed_on: Time.now,
      })
      expect(trace.reload.count).to eq 5
    end
  end

  describe '#destroy' do
    it 'should destroy the trace associated with the given item' do
      delete(:destroy, item_id: item.id, id: trace.id)
      expect(Trace.find_by_id(trace.id)).to be_nil
    end
  end
end
