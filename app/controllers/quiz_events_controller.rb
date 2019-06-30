class QuizEventsController < ApplicationController
  def new
    @quiz = Quiz.first
  end

  def create

  end
end
