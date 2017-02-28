class QuestionsController < ApplicationController
  def index
    @questions = Question.list
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @questions = Question.list
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path, notice: 'You successfully posted a new question.'
    else
      render action: 'index'
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
