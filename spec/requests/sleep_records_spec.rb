require 'swagger_helper'

RSpec.describe 'SleepRecords API', type: :request do
  let!(:user) { User.create!(name: "Test User") }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  path '/sleep_records' do
    post 'Creates a sleep record' do
      tags 'SleepRecords'
      consumes 'application/json'
      parameter name: :sleep_record, in: :body, schema: {
        type: :object,
        properties: {
          slept_at: { type: :string, format: :date_time },
          woke_up_at: { type: :string, format: :date_time }
        },
        required: ['slept_at']
      }

      response '201', 'created' do
        let(:sleep_record) { { slept_at: Time.now.iso8601 } }
        run_test!
      end
    end

    get 'Retrieves user sleep records' do
      tags 'SleepRecords'
      produces 'application/json'

      response '200', 'list of sleep records' do
        before { user.sleep_records.create!(slept_at: 10.hours.ago, woke_up_at: 2.hours.ago) }
        run_test!
      end
    end
  end
end