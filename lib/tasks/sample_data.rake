namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_infos
  end
end
def make_users
  admin = User.create!(name:     "lzh",
                       email:    "admin@admin.com",
                       password: "123456",
                       password_confirmation: "123456")
  50.times do |n|
    name  = Faker::Name.name
    email = "#{n}@#{n}.com"
    password  = "123456"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_infos
  users = User.all(limit:6)
  50.times do
    users.each { |user| user.infos.create!(
                          description: "pretty good",
                          price: 231,
                          location: "shanghai",
                          rent_start: "2013-5-6",
                          rent_end: "2013-6-5")}
  end
end