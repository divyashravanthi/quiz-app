# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quiz = Quiz.create(title: 'Next level Quiz')

# questions
question1 = quiz.questions.create(title: 'Wat je favoriete versioning tool?')
question1.answers.create(option_name: 'SVN', points: 0)
question1.answers.create(option_name: 'GIT', points: 10)
question1.answers.create(option_name: 'CVS', points: -5)
question1.answers.create(option_name: 'Mercurial', points: 5)
question1.answers.create(option_name: 'HUHH?', points: 0)

question2 = quiz.questions.create(title: 'Wat is je favoriete cat?')
question2.answers.create(option_name: 'Ceiling cat', points: 10)
question2.answers.create(option_name: 'Invisible bike cat', points: 5)
question2.answers.create(option_name: 'Octocat', points: 12)
question2.answers.create(option_name: 'Monorail cat', points: 2)


question3 = quiz.questions.create(title: 'Wat is je favoriete edelsteen?')
question3.answers.create(option_name: 'Diamant', points: 5)
question3.answers.create(option_name: 'Robijn', points: 10)
question3.answers.create(option_name: 'Kryptonite', points: 10)
question3.answers.create(option_name: 'Smaragd', points: -5)
