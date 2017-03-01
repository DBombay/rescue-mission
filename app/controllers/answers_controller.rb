class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answers_params)
    @answer.question = @question

    if @answer.save
      redirect_to @answer.question, notice: "You've successfully posted an answer!"
    else
      render :new
    end
  end

  def answers_params
    params.require(:answer).permit(:description)
  end
end
