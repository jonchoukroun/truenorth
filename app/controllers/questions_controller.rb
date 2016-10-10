class QuestionsController < ApplicationController
  helper QuestionsHelper
  before_action :authorize, except: [:index, :show]

  def index
    @questions = Question.where("category_id = ?", params[:category_id])
    @category = Category.find(params[:category_id])

    # Load with question prompt as destination of hidden form
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @category = Category.find_by(id: @question.category_id)
    @user_name = User.find_by(id: @question.user_id).name
  end

  def edit
    @question = Question.find(params[:id]) 
  end

  def create
    @question = Question.create(question_params)
    @question.user_id = current_user.id

    respond_to do |format|
      if @question.save
        format.js
      else
        @message = @question.errors.full_messages
        format.js { render 'error.js.erb' }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  private
    def question_params
      params.require(:question).permit(:title, :content, :category_id)
    end
end
