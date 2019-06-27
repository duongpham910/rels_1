# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "manh",
  email: "ducmanh@gmail.com",
  password: "123456",
  password_confirmation: "123456")

5.times do |n|
  name = "English grade #{n+1}"
  subject = Subject.create(name: name)
  5.times do |m|
    subject.exams.build(name: "faker #{m+1}", duration: Time.now).save
  end
end
