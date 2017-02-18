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
  validates :question_id, :attempt_id, :is_open, :did_open, presence: true
  belongs_to :question
  belongs_to :attempt
end
