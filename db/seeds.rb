# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true,
  avatar: File.open(File.join(Rails.root, 'public/system/users/avatars/000/000/001/', 'original','52eabf633ca6414e60a7677b0b917d92-male-avatar-maker.jpg')))

User.create(name: "foobar",
  email: "foobar@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: false,
  avatar: File.open(File.join(Rails.root, 'public/system/users/avatars/000/000/002/', 'original','man-156584_960_720.png')))

2.times do |n|
  user=User.last
  name = "English grade #{n + 1}"
  subject = Subject.create(name: name)
  2.times do |m|
    current_exam = subject.exams.create(name: "faker #{m+1}", duration: 50 + m)
    3.times do |p|
      q1 = current_exam.questions.create(content: "1+1=2?")
      a1 = q1.answers.create(content:"True",correct_answer: true)
      a2 = q1.answers.create(content:"False",correct_answer: false)
      current_exam.results.build(user_id: user.id, exam_id: current_exam.id, question_id: q1.id, answer_id: a1.id).save
    end
  end
end
