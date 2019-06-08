class User < ApplicationRecord
  has_many :tests_users

  def tests_by_level(level)
    Test.where(level: level).includes(:tests_users).where(tests_users: { user_id: self.id })
  end
end
