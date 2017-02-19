# == Schema Information
#
# Table name: exams
#
#  id               :integer          not null, primary key
#  owner_id         :integer          not null
#  title            :string           not null
#  description      :string
#  root_question_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Exam < ActiveRecord::Base
  validates :owner_id, :title, :root_question_id, presence: true

  belongs_to :owner, class_name: :User
  belongs_to :root_question, class_name: :Question

  def questions
    child_questions(root_question)
  end

  def child_questions(root_node)
    questions = [root_node]
    root_node.children.each do |child|
      questions.concat(child_questions(child))
    end
    questions
  end

  def new_attempt(user)
    attempt = Attempt.create(user: user)
    Answer.populate(self, attempt)
    attempt
  end
end
