module QuizEventsHelper

  def calculate_quiz_score(quiz_event, quiz_session)
    score = 0
    quiz_event.quiz.questions.each do |question|
      score += question.answers.find_by_id(quiz_session[question.id.to_s])&.points || 0
    end
    score
  end
end
