require 'rails_helper'

RSpec.describe QuizEventsController, type: :controller do
  let(:quiz) { Quiz.first }

  describe 'GET #index' do
    before do
      quiz.quiz_events.create(user: 'TestA')
      quiz.quiz_events.create(user: 'TestB', completed_at: Time.current, score: 10)
      quiz.quiz_events.create(user: 'TestC', completed_at: Time.current, score: 0)
    end

    it 'assigns @quiz_events with completed data' do
      get :index

      expect(assigns(:quiz_events).count).to eq(2)
      expect(assigns(:quiz_events).pluck(:completed_at)).to all be_present
    end
  end

  describe 'POST #create' do
    it 'creates a quiz event' do
      expect do
        post :create, params: { quiz_event: { user: 'TestD', quiz_id: quiz.id }}
      end.to change { QuizEvent.count }.by(1)

      expect(QuizEvent.where(user: 'TestD')).to be_present
    end
  end
end
