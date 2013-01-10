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
    let(:trace) { create(:trace, :count => 5) }
    let(:item) { trace.item }

    before :each do
      item.update_attributes({
        :week_average => 0,
        :month_average => 0,
        :year_average => 0,
        :lifetime_average => 0,
      })
      item.update_averages!
    end

    it 'updates the week average' do
      item.week_average.should eq 5
    end

    it 'updates the month average' do
      item.month_average.should eq 5
    end

    it 'updates the year average' do
      item.year_average.should eq 5
    end

    it 'updates the lifetime average' do
      item.lifetime_average.should eq 5
    end
  end
end
