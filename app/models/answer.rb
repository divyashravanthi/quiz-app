class Answer < ApplicationRecord
end

# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  option_name :string           not null
#  points      :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
