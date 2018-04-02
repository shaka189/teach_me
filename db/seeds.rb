# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create email: "tmc@gmail.com", name: "Trần Minh Chiến", password: "12345678", sex: true, password_confirmation: "12345678"
User.create email: "tmc1@gmail.com", name: "Nguyễn Đình Hiếu", password: "12345678", sex: true, password_confirmation: "12345678"
User.create email: "pvt@gmail.com", name: "Phùng Việt Tiến", password: "12345678", sex: true, password_confirmation: "12345678", admin: true
User.create email: "tmc2@gmail.com", name: "tmc", password: "12345678", sex: true, password_confirmation: "12345678"
rand = Random.new
requests = []
40.times do |n|
  requests << Request.new(topic: rand(1...4), content: Faker::Lorem.paragraph(2), header: Faker::Lorem.paragraph(2),
                 bill: 100, status: rand(1...3), user_id: "#{(n+1)%4+1}")
end
Request.import! requests

4.times do |n|
  Diploma.create! certification: "Chứng chỉ tiếng anh", demonstrate: File.open(File.join(Rails.root,'app/assets/images/chung-chi-ccna.jpg')),  user_id: "#{n+1}", verify: true
  Diploma.create! certification: "Chứng chỉ tin học", demonstrate: File.open(File.join(Rails.root,'app/assets/images/hinh-anh-va-cach-phan-biet-cac-loai-chung-chi-tin-hoc-hien-nay-2.jpg')), user_id: "#{n+1}", verify: false
  Diploma.create! certification: "Chứng chỉ Ruby on Rails", demonstrate: File.open(File.join(Rails.root,'app/assets/images/UC-WWQ55J9U.jpg')), user_id: "#{n+1}", verify: true
  Diploma.create! certification: "Chứng chỉ gia sư Teach-me", demonstrate: File.open(File.join(Rails.root,'app/assets/images/UC-WWQ55J9U.jpg')), user_id: "#{n+1}", verify: false
end

40.times do |n|
  Comment.create! content: "Câu hỏi khó quá", user_id: "#{(n+1)%4+1}", request_id: "#{n+1}"
  Comment.create! content: "Ai biết trả lời không?", user_id: "#{(n+2)%4+1}", request_id: "#{n+1}"
  Comment.create! content: "(.) Lót dép hóng", user_id: "#{(n+3)%4+1}", request_id: "#{n+1}"
 end
