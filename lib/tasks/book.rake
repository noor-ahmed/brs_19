namespace :book do
  10.times do
    desc "Create a random Book"
    task create: :environment do
      FactoryGirl.create :book
    end
  end
end


