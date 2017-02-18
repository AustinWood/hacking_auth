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
end
