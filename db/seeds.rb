# # 10.times do |i|
# #   User.create! name: Faker::Name.name, email: "user-#{i}@example.com",
# #                role: User.roles[:user], password: "password"
# # end
# #
# # Category.all.each do |category|
# #   10.times do
# #     Book.create title: Faker::Lorem.word,
# #                 author: Faker::Name.name,
# #                 publish_date: Faker::Date.backward(7300),
# #                 num_of_pages: Faker::Number.number(3),
# #                 category_id: category.id
# #   end
# # end
#
# require "factory_girl_rails"
#
# 10.times do
#   FactoryGirl.create :book
# end
