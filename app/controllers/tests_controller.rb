class TestsController < ApplicationController

  before_action :find_test, only: %i[show]
  # after_action :send_log_message
  # around_action :log_execute_time

  def index
    @tests = Test.all
    # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    # render html: '<h1>Hello!</h1>'.html_safe

    # render json: { tests: Test.all }

    # render inline: '<p>Hello <%= %[ybuR].reverse! %>!</p>'

    # render file: 'public/about', layout: false

    # head :no_content
    # render inline: '<%= console %>'
    # logger.info(self.object_id)

    # respond_to do |format|
    #   format.html { render plain: 'All Tests' }
    #   format.json { render json: { tests: Test.all } }
    # end
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    # @question = @test.questions.new(question_params)
    respond_to do |format|
      if @test.save
        format.html { redirect_to tests_path, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        render plain: @test.inspect
        # format.html { render :new }
        # format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # def send_log_message
  #   logger.info("Action [#{action_name}] was finished")
  # end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

end
