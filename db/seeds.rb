# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

20.times do |n|
  genre= Faker::Book.genre
  Category.create!(name: genre)
end