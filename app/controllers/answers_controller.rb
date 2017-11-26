class AnswersController < ApplicationController
  load_and_authorize_resource
  def new
    @question=Question.find(params[:id])
  end
  def create
    @question=Question.find(params[:question_id])
    @answer=Answer.new(answer_params)
    @answer.user=current_user
    @answer.question=@question
    if @answer.save
      redirect_to questions_path
    else
      render :new
    end
  end
  def destroy
    @question=Question.find(params[:question_id])
    @answer=Answer.find(params[:id])
    @answer.destroy
    redirect_to questions_path
  end
  protected
  def answer_params
    params.require(:answer).permit(:content)
  end
end
