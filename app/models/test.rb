class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  alias_attribute :author, :user
  belongs_to :user

  def self.sort_by_category(category)
    Test.pluck(:title).joins(:category).where(categories: { title: category }).order(title: :desc)
  end
end
