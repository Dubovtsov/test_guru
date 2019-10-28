class BadgeRule < ApplicationRecord
  has_many :badges, dependent: :destroy

  def self.reward(test_passage, current_user)
    @category = test_passage.test.category.id
    @current_user = current_user
    @all_tests_in_the_category = Test.all.where(category_id: @category).count
    @user_test_passages = @current_user.test_passages.where(test_id: Test.where(category_id: @category))

    @successful_test ||= 0

    @user_test_passages.each do |test_passage|
      @successful_test += 1 if test_passage.successfully?
    end

    if @successful_test == 1
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 2).take
      current_user.badges.push(@badge) if @badge.present?
      # the_first_test_in_the_category(@category, @current_user)
    elsif @successful_test == @all_tests_in_the_category && @user_test_passages.count == @successful_test
      @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 1).take
      current_user.badges.push(@badge) if @badge.present?
      # all_tests_in_the_category(@category, @current_user)
    else
    end
  end

  private

  def the_first_test_in_the_category(category, current_user)
    @badge = Badge.where("category_id = ? AND badge_rule_id = ?", category, 2).take
    current_user.badges.push(@badge) if @badge.present?
  end

  def all_tests_in_the_category(category, current_user)
    @badge = Badge.where("category_id = ? AND badge_rule_id = ?", category, 1).take
    current_user.badges.push(@badge) if @badge.present?
  end
end
