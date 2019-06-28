class User < ApplicationRecord
  has_many :test_passages
  has_many :categories
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests, through: :test_passeges
  has_many :questions
  has_many :answer

  validates :email, presence: true

  def tests_by_level(level)
    Test.where(level: level).includes(:tests_users).where(tests_users: { user_id: self.id })
  end
end
