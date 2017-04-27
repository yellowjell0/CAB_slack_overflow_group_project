10.times do
  User.create(user_name: Faker::Name.name, email: Faker::Internet.email, hashed_password: 'password')
  Question.create(title: Faker::Lorem.sentence + "?", body: Faker::Lorem.sentence(5), user_id: rand(1..10), comment_id: rand(1..10))
  Answer.create(body: Faker::ChuckNorris.fact, comment_id: rand(1..10), user_id: rand(1..10))
  Comment.create(body: Faker::ChuckNorris.fact, user_id: rand(1..10))
  Vote.create(value: 1)
end
