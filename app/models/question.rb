class Question < ApplicationRecord
  has_many :answers
  belongs_to :quiz

  attr_accessor :selected_option
end

# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
