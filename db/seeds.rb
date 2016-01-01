20.times do |n|
  Category.create! name: Faker::Book.genre
end
10.times do |i|
  User.create! name: Faker::Name.name, email: "user-#{i}@example.com", 
    role: User.roles[:user], password: "password"
end