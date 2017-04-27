10.times do
  user =User.create(user_name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
  5.times do
    question = Question.create(title: Faker::Lorem.sentence + "?", body: Faker::Lorem.sentence(5))
    user.questions << question

    answer  = Answer.create(body: Faker::ChuckNorris.fact)
    answer.user = User.find(rand(1..User.count))
    question.answers << answer

    comment = Comment.create(body: Faker::ChuckNorris.fact)
    comment.user = User.find(rand(1..User.count))
    question.comments << comment
    answer.comments << comment
  end
end

