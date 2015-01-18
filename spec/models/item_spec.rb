require 'spec_helper'

describe Item do
  describe '#user' do
    it { should belong_to(:user) }
  end

  describe '#tracks' do
    it { should have_many(:traces) }
  end

  describe '#valid?' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
  end

  describe '#update_averages!' do
    let(:trace) { create(:trace, count: 5) }
    let(:item) { trace.item }

    before :each do
      item.traces.create(count: 5)
    end

    it 'updates the week average' do
      expect(item.week_average).to eq 5
    end

    it 'updates the month average' do
      expect(item.month_average).to eq 5
    end

    it 'updates the year average' do
      expect(item.year_average).to eq 5
    end

    it 'updates the lifetime average' do
      expect(item.lifetime_average).to eq 5
    end
  end
end
