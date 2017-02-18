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
end
