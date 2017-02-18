# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  text       :string
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
    until self.parent_id.nil?
      question = question.parent
    end
    question
  end
end
