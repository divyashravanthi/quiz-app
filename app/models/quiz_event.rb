class QuizEvent < ApplicationRecord
  belongs_to :quiz

  validates_presence_of :user

  scope :completed, -> { where.not(completed_at: nil) }

  def total_steps
    quiz.questions.size
  end
end

# == Schema Information
#
# Table name: quiz_events
#
#  id           :integer          not null, primary key
#  user         :string           not null
#  completed_at :datetime
#  score        :integer
#  quiz_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
