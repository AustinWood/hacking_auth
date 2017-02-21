class AttemptsController < ApplicationController
  def index
    render :index
  end

  def show

    render :show
  end

  def update
    # fail
    q = Question.find_by(id: params[:attempt][:question_id].to_i)
    new_bool = !q.is_open
    if q.update_attributes(is_open: new_bool)
      redirect_to attempt_url(1)
    else
      fail
    end
  end

  def attempt_params
    params.require(:attempt).permit(:answer_id)
  end
end
