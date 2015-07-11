class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
      if @question.save
        flash[:notice] = "Question has been asked"
        redirect_to questions_path
      else
        flash[:error] = "Not sure if that was a question or not, but try again because something went wrong."
        render :new
      end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update_attributes(params.require(:question).permit(:title, :body))
        flash[:notice] = "Question has been updated"
        redirect_to questions_path
      else
        flash[:error] = "Not sure if that was a question or not, but try again because something went wrong."
        render :new
      end
  end

  def delete
  end

end
