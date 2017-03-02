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
      redirect_to @question, notice: 'You successfully posted a new question.'
    else
      @error = @question.errors
      render action: 'index'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.assign_attributes(question_params)

    if @question .valid?
      @question.save
      redirect_to @question
    else
      @error = @question.errors
      render action: 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete

    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
