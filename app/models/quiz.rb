class Quiz < ApplicationRecord
  has_many :questions
  has_many :quiz_events
end

# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
