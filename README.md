# README

To boot up the application from a fresh environment

* `bundle install`

* `rails db:migrate`

* `rails db:seed`

The application is deployed to https://user-quiz.herokuapp.com/ this url
 - If there are >=1 quizzes taken, they can be viewed in the https://user-quiz.herokuapp.com/quiz_events section for an overview of all results.
 - Session variables are used for temporary results storage which will be cleared after the quiz is complete for each user session.
