class RewardService
  attr_reader :response

  def initialize(category)
    @category = category
  end

  
  def reward
    @category = @test_passage.test.category.id
    @all_tests_in_the_category = Test.all.where(category_id: @category).count
    @user_test_passages = current_user.test_passages.where(test_id: Test.where(category_id: @category))
    
    @successful_test ||= 0
    
    @user_test_passages.each do |test_passage|
      @successful_test += 1 if test_passage.successfully?
    end

    if @successful_test == 1
      the_first_test_in_the_category
    elsif @successful_test == @all_tests_in_the_category && @user_test_passages.count == @successful_test
      all_test_in_the_category
    else
    end
  end
  
  def the_first_test_in_the_category
    @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 2).take
    current_user.badges.push(@badge) if @badge.present?
  end
  
  def all_test_in_the_category
    @badge = Badge.where("category_id = ? AND badge_rule_id = ?", @category, 1).take
    current_user.badges.push(@badge) if @badge.present?
  end

end
