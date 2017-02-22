# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  attempt_id  :integer
#  is_open     :boolean
#  did_open    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  validates :question_id, :attempt_id, presence: true
  belongs_to :question
  belongs_to :attempt

  def self.populate(exam, attempt)
    exam.questions.each do |question|
      Answer.create(
        question_id: question.id,
        attempt_id: attempt.id,
        is_open: false,
        did_open: false
      )
    end
  end

  def parent
    question = Question.find_by(id: self.question_id)
    Answer.find_by(question_id: question.parent, attempt_id: 1)
  end
end
