class RewardService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @category = test_passage.test.category.id
    @all_tests_in_the_category = Test.all.where(category_id: @category).count
    @user_test_passages_success = @user.test_passages.select("user_id, test_id").where(test_id: Test.where(category_id: @category), success: true).distinct!
  end

  def call
    the_first_test_successfull
    all_test_in_the_category
  end

  private

  def the_first_test_successfull
    if @user_test_passages_success.size == 1
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 2).take
      @user.badges.push(@badge) if @badge.present?
    end
  end

  def all_test_in_the_category
    if @user_test_passages_success.size == @all_tests_in_the_category
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 1).take
      @user.badges.push(@badge) if @badge.present?
    end
  end

end
