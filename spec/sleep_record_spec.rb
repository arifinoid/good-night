require 'rails_helper'

RSpec.describe SleepRecord, type: :model do
  it { should belong_to(:user) }

  describe '#duration' do
    it 'returns the difference between woke_up_at and slept_at' do
      record = described_class.new(slept_at: 8.hours.ago, woke_up_at: Time.current)
      expect(record.duration).to be_within(1.second).of(8.hours)
    end
  end
end
