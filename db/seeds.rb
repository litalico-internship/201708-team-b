# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  # prefectures = Constants::PREFECTURES
  # prefectures.limit(40).each.with_index(50) do |i, p|
  #   User.create(name: 'seed', nickname: 'test', email: "#{p}@seed.com", age: '15', sexuality: 1, location: i[1], password: "#{p}pass")
  # end

  User.create(name: 'Takato Hayakawa', nickname: 'Takato', email: 'test@takato.com', age: '15', sexuality: 1, location: "Tokyo", password: 'password', icon_image: 'takato.jpeg')
  User.create(name: 'Kosuke Suzuki', nickname: 'Kosuke', email: 'test@kosuke.com', age: '15', sexuality: 1, location: "Kyoto", password: 'password', icon_image: 'suzu.jpg')
  User.create(name: 'Joto Ayuki', nickname: 'Kansai', email: 'test@kansai.com', age: '15', sexuality: 1, location: "Osaka", password: 'password', icon_image: 'kansai.png')
  User.create(name: 'Hayato Takemoto', nickname: 'Hayato', email: 'test@hayato.com', age: '15', sexuality: 1, location: "Tokyo", password: 'password', icon_image: 'take.png')
  User.create(name: 'Yudai Tsukamoto', nickname: 'Yudai', email: 'test@yudai.com', age: '15', sexuality: 1, location: "Nagoya", password: 'password', icon_image: 'mentor.png')
