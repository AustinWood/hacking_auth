# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  text       :string
#  is_open    :boolean
#  did_open   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  validates :text, presence: true
  has_many :answers
  # TODO Did I set up parent/children associations correctly?
  belongs_to :parent, class_name: :Question
  has_many :children, class_name: :Question, foreign_key: :parent_id

  def root_question
    question = self
    until question.parent_id.nil?
      question = question.parent
    end
    question
  end

  def descendants
    descendant_nodes = self.children
    self.children.each do |child|
      descendant_nodes.concat(child.descendants)
    end
    descendant_nodes
  end

  def indentation
    i = 0
    question = self
    until question.parent_id.nil?
      question = question.parent
      i += 1
    end
    i
  end

  # def is_open?
  #   answer = Answer.find_by(question_id: self.id, attempt_id: 1)
  #   answer.is_open
  # end

  def ancestors
    ancestors_arr = []
    question = self
    until question.parent_id.nil?
      question = Question.find(question.parent_id)
      ancestors_arr << question
    end
    ancestors_arr
  end

  def ancestors_open?
    ancestors.all? { |q| q.is_open }
  end

  # def clicked
  #   # if self.is_open
  #   #   self.is_open = false
  #   #   self.question.descendants.each do |descendant|
  #   #     ans = Answer.find_by(question_id: descendant.id)
  #   #     ans.is_open = false
  #   #     ans.save
  #   #   end
  #   # else
  #   #   self.is_open = true
  #   # end
  #   new_bool = !self.is_open
  #   self.update_attributes(is_open: new_bool)
  #   #self.did_open = true
  #   #self.save
  # end
end
