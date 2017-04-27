10.times do
  User.create(user_name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
  Question.create(body: Faker::Lorem.sentence, user_id: rand(1..10), comment_id: rand(1..10))
  Answer.create(body: Faker::ChuckNorris.fact, comment_id: rand(1..10), user_id: rand(1..10))
  Comment.create(body: Faker::ChuckNorris.fact, user_id: rand(1..10))
  Vote.create(value: 1)
end
