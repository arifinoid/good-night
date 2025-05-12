require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:sleep_records).dependent(:destroy) }
  it { should have_many(:followings).through(:active_follows) }
  it { should have_many(:followers).through(:passive_follows) }
end
