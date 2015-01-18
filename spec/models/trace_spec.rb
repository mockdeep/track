require 'spec_helper'

describe Trace do
  describe 'associations' do
    it { should belong_to(:item) }
  end

  describe '.day_count' do
    context 'when multiple items are on the same day' do
      it 'returns 1' do
        time = Time.zone.now.beginning_of_day
        create(:trace, :executed_on => time)
        create(:trace, :executed_on => time + 1.hour)
        expect(Trace.day_count).to eq 1
      end
    end

    context 'when items are across 2 days' do
      it 'returns 2' do
        time1 = Time.zone.now
        time2 = 1.day.ago
        create(:trace, :executed_on => time1)
        create(:trace, :executed_on => time2)
        expect(Trace.day_count).to eq 2
      end
    end

    context 'when items are across 3 days' do
      it 'returns 3' do
        time1 = Time.zone.now
        time2 = 2.days.ago
        create(:trace, :executed_on => time1)
        create(:trace, :executed_on => time2)
        expect(Trace.day_count).to eq 3
      end
    end
  end

  describe '#valid?' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:count) }
    it { should validate_presence_of(:executed_on) }

    context 'when executed_on is in future' do
      it 'returns false' do
        trace = Trace.new(:executed_on => 2.days.from_now)
        expect(trace).to_not be_valid
        message = 'Executed on cannot be in future'
        expect(trace.errors.full_messages).to include(message)
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
        expect(item).to receive(:update_averages!)
        create(:trace, :item => item)
      end
    end
  end
end
