class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answers_params)
    @answers = @question.answers
    @answer.question = @question

    if @answer.save
      redirect_to @answer.question, notice: "You've successfully posted an answer!"
    else
      @error = @answer.errors
      render 'questions/show'
    end
  end

  def answers_params
    params.require(:answer).permit(:description)
  end
end
