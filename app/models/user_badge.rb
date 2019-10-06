class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge


  def reward(test_passage)
    @category = test_passage.test.category.id
    # Создать метод сравнивающий количество пройденных тестов 
    # с их общим количеством в категории
    
    @all_tests_in_the_category = Test.all.where(category_id: @category).count
    @user_test_passages = current_user.tests.joins(:test_passages).where(category_id: @category).distinct!.count
    
    if @user_test_passages == 0
      current_user.badges.push(@badge)
    elsif @user_test_passages == @all_tests_in_the_category
      current_user.badges.push(@badge)
    else
      
    end
  end
end
