namespace :category do
  10.times do
    desc "Create a random category"
    task create: :environment do
      FactoryGirl.create :category
    end
  end
end