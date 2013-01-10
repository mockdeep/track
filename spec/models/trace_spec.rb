require 'spec_helper'

describe Trace do
  describe '#item' do
    it { should belong_to(:item) }
  end

  describe '#valid?' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:count) }
    it { should validate_presence_of(:executed_on) }
  end

  describe 'scopes' do
    let!(:trace1) { create(:trace, :executed_on => Time.now, :count => 3) }
    let!(:trace2) { create(:trace, :executed_on => 8.days.ago, :count => 4) }
    let!(:trace3) { create(:trace, :executed_on => 2.months.ago, :count => 5) }
    let!(:trace4) { create(:trace, :executed_on => 2.years.ago, :count => 6) }

    describe '.week' do
      it 'returns traces executed in the past week' do
        Trace.week.should eq [trace1]
      end
    end

    describe '.month' do
      it 'returns traces executed in the past month' do
        Trace.month.should include trace1
        Trace.month.should include trace2
        Trace.month.should_not include trace3
        Trace.month.should_not include trace4
      end
    end

    describe '.year' do
      it 'returns traces executed in the past year' do
        Trace.year.should include trace1
        Trace.year.should include trace2
        Trace.year.should include trace3
        Trace.year.should_not include trace4
      end
    end
  end

  describe '#update_averages!' do
    context 'on create' do
      it 'updates averages for its item' do
        item = create(:item)
        item.should_receive(:update_averages!)
        create(:trace, :item => item)
      end
    end
  end

end
