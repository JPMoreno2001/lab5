# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


5.times do
    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end
  
  10.times do
    user = User.order("RANDOM()").first 
    Post.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      user_id: user.id,
      published_at: Faker::Time.between(from: DateTime.now - 1.year, to: DateTime.now),
      answers_count: rand(0..10),
      likes_count: rand(0..100)
    )
  end
  