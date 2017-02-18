Send a message if you want to be added to this repo as a collaborator:
* Slack: AustinWood
* Email: austin@austinkwood.com

Ideas for how to implement collapsible tree view:
* http://www.howtocreate.co.uk/tutorials/jsexamples/listCollapseExample.html
* https://www.w3schools.com/jquerymobile/tryit.asp?filename=tryjqmob_lists_collapsible


Psudo code to implement later:

def create_new_attempt
  exam = auth_exam
  attempt = Attempt.new
  exam.questions.each do |question|
    Answer.create(
      question_id = question.id,
      attempt_id = attempt.id,
      is_open = false
      did_open = false
      )
  end
end
