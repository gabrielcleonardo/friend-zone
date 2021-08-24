# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "cleaning the database"
User.destroy_all
puts "database cleaned"
puts "seeding database..."
  40.times do
    user = User.new(
      name: Faker::TvShows::SouthPark.character,
      user_name: Faker::Internet.username,
      cpf: Faker::IDNumber.croatian_id,
      address: Faker::Address.street_address,
      email: Faker::Internet.email,
      password: '123456',
      is_professional: false,
      is_available: true,
      interests: ApplicationController::INTERESTS.sample(rand(1..6))
    )
    user.save!
    puts "#{user.id} - #{user.name} created"
  end
puts "#{User.count} users created"
