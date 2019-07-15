class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[show destroy edit update start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to tests_path, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to tests_path, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    render plain: 'Question was successfully destroyed.'
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_user
    @user = current_user
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
