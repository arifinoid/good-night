require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/users/{id}/follow' do
    post 'Follow a user' do
      tags 'Users'
      parameter name: :id, in: :path, type: :string

      response '204', 'followed successfully' do
        let(:id) { User.create!(name: "TestUser").id }
        run_test!
      end
    end
  end

  path '/users/{id}/unfollow' do
    delete 'Unfollow a user' do
      tags 'Users'
      parameter name: :id, in: :path, type: :string

      response '204', 'unfollowed successfully' do
        let(:id) { User.create!(name: "TestUser2").id }
        run_test!
      end
    end
  end

  path '/users/{id}/followings/sleep_records' do
    get "Retrieve followings' sleep records sorted by duration" do
      tags 'Users'
      parameter name: :id, in: :path, type: :string

      response '200', 'retrieved successfully' do
        let(:id) { User.create!(name: "TestUser3").id }
        run_test!
      end
    end
  end
end

