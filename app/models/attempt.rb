# == Schema Information
#
# Table name: attempts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  stop_time  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attempt < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :user
  has_many :answers

  def self.new_attempt(user)
    Attempt.create(user_id: user.id)
  end

  def answers
    Answer.where("attempt_id = #{self.id}")
  end
end
