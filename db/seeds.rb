# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.create!(name: "Alice")
user2 = User.create!(name: "Bob")
user3 = User.create!(name: "Charlie")

user1.followings << user2
user1.followings << user3

user1.sleep_records.create!(slept_at: 10.hours.ago, woke_up_at: 2.hours.ago)
user2.sleep_records.create!(slept_at: 9.hours.ago, woke_up_at: 1.hour.ago)
user3.sleep_records.create!(slept_at: 8.hours.ago, woke_up_at: Time.current)