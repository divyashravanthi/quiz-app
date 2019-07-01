require 'rails_helper'

RSpec.describe QuizEvent, type: :model do
  let(:quiz) { Quiz.first}
  let(:event) { quiz.quiz_events.create(user: 'TestA') }

  describe '#total_steps' do
    it 'returns an integer count of total number of questions in the quiz' do
      expect(event.total_steps).to eq(quiz.questions.count)
    end
  end
end
