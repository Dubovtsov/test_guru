class User < ApplicationRecord
  has_many :tests_users
  has_many :categories
  alias_attribute :created_tests, :tests
  has_many :created_tests
  has_many :tests, through: :tests_users
  has_many :questions
  has_many :answer

  def tests_by_level(level)
    Test.where(level: level).includes(:tests_users).where(tests_users: { user_id: self.id })
  end
end
