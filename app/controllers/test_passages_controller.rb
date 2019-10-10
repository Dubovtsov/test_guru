class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.compleated_test(@test_passage).deliver_now

      reward(@test_passage)


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

  def reward(test_passage)
    @category = test_passage.test.category.id
    # Создать метод сравнивающий количество пройденных тестов
    # с их общим количеством в категории

    @all_tests_in_the_category = Test.all.where(category_id: @category).count
    @user_test_passages = current_user.tests.joins(:test_passages).where(category_id: @category).distinct!.count

    if @user_test_passages == 0
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 3).take
      current_user.badges.push(@badge)
    elsif @user_test_passages == @all_tests_in_the_category
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 2).take
      current_user.badges.push(@badge)
    else
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
