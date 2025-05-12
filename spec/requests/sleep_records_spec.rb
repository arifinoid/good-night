require 'swagger_helper'

RSpec.describe 'SleepRecords API', type: :request do
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
  end
end
