# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Get sample user alice or create one
user = User.first || User.create(email: "alice@x.com", password: "password", sex: "female", height: 63)

# Define a range of dates for which you want to create metrics
start_date = 30.days.ago.to_date
end_date = Date.today

(start_date..end_date).each do |date|
  # Create a new metric record for each date
  user.metrics.create(
    weight: rand(100..180), # Random weight
    fat_percentage: rand(10..25), # Random fat percentage
    muscle_percentage: rand(30..50), # Random muscle percentage
    created_at: date,
    updated_at: date
  )
end
