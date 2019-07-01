class QuizEventsController < ApplicationController
  include QuizEventsHelper
  helper_method :current_step

  def new
    @quiz = Quiz.first
  end

  def index
    @quiz_events = QuizEvent.completed
  end

  def create
    quiz_event = QuizEvent.create(quiz_event_params)

    redirect_to action: 'proceed', id: quiz_event.id
  end

  def proceed
    @quiz_event = QuizEvent.find(params[:id])

    # Store the chosen answer for the question in scope
    set_quiz_answer

    # Handle steps(inc/dec) through the quiz questions progress
    set_current_step

    if current_step == @quiz_event.total_steps
      submit_quiz
      render 'results'
    else
      @question = @quiz_event.quiz.questions[current_step]
      @question.selected_option = quiz_session[@question.id.to_s]
    end
  end

  private

  def quiz_event_params
    params.require(:quiz_event).permit(:user, :quiz_id)
  end

  def process_current_step
    if params[:previous_step]
      current_step - 1
    elsif current_step
      current_step + 1
    else
      current_step || 0
    end
  end

  def submit_quiz
    @quiz_event.update(completed_at: Time.current, score: calculate_quiz_score(@quiz_event, quiz_session))
    session.delete("quiz_event_#{@quiz_event.id}")
  end

  def current_step
    quiz_session["current_step"]
  end

  def quiz_session
    session["quiz_event_#{@quiz_event.id}"]
  end

  def set_current_step
    session["quiz_event_#{@quiz_event.id}"]["current_step"] = process_current_step
  end

  def set_quiz_answer
    session["quiz_event_#{@quiz_event.id}"] ||= {}
    session["quiz_event_#{@quiz_event.id}"][params[:question_id]] = params[:question][:selected_option] if params[:question]
  end
end
