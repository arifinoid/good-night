class SleepRecord < ApplicationRecord
  belongs_to :user

  def duration
    return nil unless slept_at && woke_up_at
    woke_up_at - slept_at
  end
end
