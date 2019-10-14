class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.compleated_test(@test_passage).deliver_now
      reward
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
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

  def reward
    @category = @test_passage.test.category.id

    @all_tests_in_the_category = Test.all.where(category_id: @category).count
    @user_tests = current_user.tests.joins(:test_passages).where(category_id: @category)
    @user_test_passages = []
    @user_tests.each do |test|
      @user_test_passages << current_user.test_passages.find(test_id: test.id)
    end
    
    @successful_test ||= 0
    @user_test_passages.each do |test_passage|
      @successful_test += 1 if test_passage.successefully?
    end
      
#    @user_test_passages = current_user.tests.joins(:test_passages).where(category_id: @category).distinct!.count
# successfully?
    if @user_test_passages == 1 && @test_passage.successfully?
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 2).take
      current_user.badges.push(@badge) if @badge.present?
    elsif @user_test_passages == @all_tests_in_the_category && @test_passage.successfully?
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 1).take
      current_user.badges.push(@badge) if @badge.present?
    else
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
