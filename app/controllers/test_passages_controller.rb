class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    @time_start = @test_passage.created_at.min
    @time_end = Time.current.min
    @timer = @test_passage.test.timer

    if @time_end - @time_start <= @timer
      if @test_passage.completed?
        RewardService.new(@test_passage).call if @test_passage.successfully?
        TestsMailer.compleated_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    else
      redirect_to root_path, notice: 'Жулик, не балуй!'
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call

    flash_options = if result.success?
      current_user.gists.create(
        question: @test_passage.current_question,
        gistid: result.response.id,
        url: result.response.html_url)

      { notice: t('.success', url: (helpers.link_to 'Gist', result.response.html_url, target: '_blank')) }
    else
      { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options

  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
