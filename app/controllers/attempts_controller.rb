class AttemptsController < ApplicationController
  def index
    render :index
  end

  def show

    render :show
  end

  def update
    Answer.find_by(params[:answer_id]).clicked
    
    render :show
  end

  def attempt_params
    params.require(:attempt).permit(:answer_id)
  end
end
