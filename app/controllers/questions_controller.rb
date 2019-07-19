class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: %i[show destroy edit update]
  before_action :find_test, only: %i[new index create update destroy]

  private

  def rescue_with_question_not_found
    render plain: "404. Question not found!"
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
