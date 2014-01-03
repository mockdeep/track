require 'spec_helper'

describe Trace do
  describe '#item' do
    it { should belong_to(:item) }
  end

  describe '#valid?' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:count) }
    it { should validate_presence_of(:executed_on) }

    context 'when executed_on is in future' do
      it 'returns false' do
        trace = Trace.new(:executed_on => 2.days.from_now)
        expect(trace).to_not be_valid
        expect(trace.errors.full_messages).to include('Executed on cannot be in future')
      end
    end
  end

  describe 'scopes' do
    let!(:trace1) { create(:trace, :executed_on => Time.now, :count => 3) }
    let!(:trace2) { create(:trace, :executed_on => 8.days.ago, :count => 4) }
    let!(:trace3) { create(:trace, :executed_on => 2.months.ago, :count => 5) }
    let!(:trace4) { create(:trace, :executed_on => 2.years.ago, :count => 6) }

    describe '.week' do
      it 'returns traces executed in the past week' do
        expect(Trace.week).to eq [trace1]
      end
    end

    describe '.month' do
      it 'returns traces executed in the past month' do
        expect(Trace.month).to include trace1
        expect(Trace.month).to include trace2
        expect(Trace.month).to_not include trace3
        expect(Trace.month).to_not include trace4
      end
    end

    describe '.year' do
      it 'returns traces executed in the past year' do
        expect(Trace.year).to include trace1
        expect(Trace.year).to include trace2
        expect(Trace.year).to include trace3
        expect(Trace.year).to_not include trace4
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
