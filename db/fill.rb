require 'csv'
require 'byebug'

raw_questions = CSV.read("dynamic_seeds.csv", {col_sep: "^"})
#
# raw_questions.map! do |question|
#   question.map { |el| el.strip.split(':') }
# end

id_hash = {}
raw_questions.each_with_index { |question, i| id_hash[question[0]] = i + 1 }

questions = []
raw_questions.each do |question|
  text = question[1].strip
  parent_id = id_hash[question[2]]
  if parent_id.nil?
    string = "Question.create!(text: '#{text}', parent_id: nil)"
  else
    string = "Question.create!(text: '#{text}', parent_id: '#{parent_id}')"
  end
  questions << string
end



open('seeds.rb', 'w') do |f|
  questions.each do |question|
    f.puts question
  end
end
