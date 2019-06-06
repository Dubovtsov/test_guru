class User < ApplicationRecord
  has_many :completed_tests

  def tests_by_level(level)
    Test.where(level: level).includes(:completed_tests).where(completed_tests: { user_id: self.id })
  # Добавить условие
  end
end
