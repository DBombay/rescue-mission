class QuestionsController < ApplicationController
  def index
    @questions = Question.list
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)

    redirect_to @question
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
