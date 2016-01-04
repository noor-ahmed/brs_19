require "faker"
FactoryGirl.define do

  factory :book do
    title Faker::Name.name
    author Faker::Name.name
    publish_date Faker::Date.backward((Faker::Number.number 3).to_i)
    num_of_pages Faker::Number.number(3)
    category_id {Category.take.id if Category.exists?}
  end

  factory :category do
    name Faker::Name.name
    image Faker::Name.name
  end

end