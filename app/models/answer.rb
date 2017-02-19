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
    puts "hit populate ***"
    exam.questions.each do |question|
      puts question.text
      answer = Answer.new(question_id: question.id, attempt_id: attempt.id, is_open: false, did_open: false)
      if answer.valid?
        puts "VALID"
        answer.save
      else
        puts "NOT VALID"
      end
    end
  end

  def parent
    question = Question.find_by(id: self.question_id)
    Answer.find_by(question_id: question.parent)
  end

  def clicked
    self.is_open = !self.is_open
    self.did_open = true
    self.save
  end

  def self.print_shit

  end
end
