namespace :admin do
  desc "Create admin account"
  task :create, [:name, :email, :password] => :environment do |t, args|
    admin = User.create! name: args[:name], email: args[:email],
      role: User.roles[:admin], password: args[:password]
  end
end