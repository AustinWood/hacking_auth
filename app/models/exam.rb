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
end
