class RewardService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @category = test_passage.test.category.id
    @all_tests_in_the_category = Test.all.where(category_id: @category).count
    @user_test_passages = @user.test_passages.select("user_id, test_id").where(test_id: Test.where(category_id: @category)).distinct!

  end

  def call
    if @test_passage.successfully?
      the_first_test_successfull
      all_test_in_the_category
    end
  end

  private

  def reward(badge)
    @user.badges << badge
  end

  def successful_tests
    @successful_tests ||= 0

    @user_test_passages.each do |test_passage|
      @successful_tests += 1 if test_passage.successfully?
    end
    @successful_tests
  end

  def the_first_test_successfull
    if successful_tests == 1
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 2).take
      @user.badges.push(@badge) if @badge.present?
    else
    end
  end

  def all_test_in_the_category
    if successful_tests == @all_tests_in_the_category && @user_test_passages.count == @successful_tests
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 1).take
      @user.badges.push(@badge) if @badge.present?
    else
    end
  end

end

# class RewardService
#   attr_reader :response
#
#   def initialize(category)
#     @category = category
#   end
#
#
#   def reward
#     @category = @test_passage.test.category.id
#     @all_tests_in_the_category = Test.all.where(category_id: @category).count
#     @user_test_passages = current_user.test_passages.where(test_id: Test.where(category_id: @category))
#
#     @successful_test ||= 0
#
#     @user_test_passages.each do |test_passage|
#       @successful_test += 1 if test_passage.successfully?
#     end
#
#     if @successful_test == 1
#       the_first_test_successfull
#     elsif @successful_test == @all_tests_in_the_category && @user_test_passages.count == @successful_test
#       all_test_in_the_category
#     else
#     end
#   end
#
#   def the_first_test_successfull
#     @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 2).take
#     current_user.badges.push(@badge) if @badge.present?
#   end
#
#   def all_test_in_the_category
#     @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 1).take
#     current_user.badges.push(@badge) if @badge.present?
#   end
#
# end
