namespace :db do
  desc "Fill database with sample data"
  task users: :environment do
    make_users
  end
end
def make_users
  admin = User.create!(name:     "lzh",
                       email:    "admin@admin.com",
                       password: "123456",
                       password_confirmation: "123456")
  20.times do |n|
    name  = Faker::Name.name
    email = "#{n}@#{n}.com"
    password  = "123456"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end
namespace :lzh do
  desc "make some cars sample"
  task cars: :environment do
    make_cars
  end
end
def make_cars
  users = User.all(limit:6)
  5.times do
    users.each { |user| user.cars.create!(
                          description: "pretty good",
                          band: "randrover",
                          price: 231,
                          city: "hefei",
                          location: "longjushanzhuang")}
  end
end

namespace :lzh do
  desc "make some infos sample"
  task infos: :environment do
    make_infos
  end
end
def make_infos
  cars = Car.all
  cars.each { |car| car.infos.create!(
                        rent_start: "2013-6-8",
                        rent_end: "2013-6-10")}
end

namespace :lzh do
  desc "make some comments"
  task comments: :environment do
    make_comments
  end
end
def make_comments
  cars = Car.all
  cars.each do |car|
    5.times do
      car.comments.create!(content: "pretty good")
    end
  end
  comments = Comment.all
  comments.each { |comment| comment.user_id = 3 }
end