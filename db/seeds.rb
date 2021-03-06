10.times do

  user = User.create(user_name: Faker::Name.name, email: Faker::Internet.email, password: 'password')

  5.times do
    question = Question.create(title: Faker::Lorem.sentence, body: Faker::Lorem.sentence(5))
    user.questions << question
    rand(1..100).times do
      question.votes << Vote.create(v_type: "up", user_id:rand(1..10))
    end
    rand(1..20).times do
      question.votes << Vote.create(v_type: "down", user_id:rand(1..10))
    end
    rand(1..15).times do
      answer  = Answer.create(body: Faker::ChuckNorris.fact)
      answer.user = User.find(rand(1..User.count))
      question.answers << answer
      comment = Comment.create(body: Faker::ChuckNorris.fact)
      comment.user = User.find(rand(1..User.count))
      question.comments << Comment.create(body: Faker::ChuckNorris.fact, user_id: rand(1..User.count))
      answer.comments << Comment.create(body: Faker::ChuckNorris.fact, user_id: rand(1..User.count))
    end
  end

  user.save

end


