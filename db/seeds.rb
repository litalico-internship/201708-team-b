# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  prefectures = Constants::PREFECTURES
  prefectures.each_with_index do |i, p|
    User.create(name: 'seed', nickname: 'test', email: "#{p}@seed.com", age: '15', sexuality: 1, location: i[1], password: "#{p}pass")
  end
