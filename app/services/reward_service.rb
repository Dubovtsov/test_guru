class RewardService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    if successfull_test?
      first_try_successfull
      category_complete
    end
  end

  private

  def give_badge(badge)
    @user.badges << badge
  end

  def successfull_test?
    @test_passage.successfully?
  end

  def first_try_successfull
    @user.tests.where(id: @test.id).count == 1
    give_badge(BadgeRule.where(rule: 'first_try_complete').first.badge)
  end

  def level_complete
    level = BadgeRule.where(rule: 'level_complete').first.value
    tests_ids = Test.levels_test(level).ids
    complete_tests_ids = @user.tests.levels_test(level).distinct.ids

    if complete_tests_ids == tests_ids
      give_badge(BadgeRule.where(rule: 'level_complete').first.badge)
    end
  end

  def category_complete
    category = BadgeRule.where(rule: 'category_complete').first.value

    tests_ids = Test.categories_test(category).ids
    complete_tests_ids = @user.tests.categories_test(category).distinct.ids

    if complete_tests_ids == tests_ids
      give_badge(BadgeRule.where(rule: 'category_complete').first.badge)
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
#       the_first_test_in_the_category
#     elsif @successful_test == @all_tests_in_the_category && @user_test_passages.count == @successful_test
#       all_test_in_the_category
#     else
#     end
#   end
#
#   def the_first_test_in_the_category
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
