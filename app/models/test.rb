class Test < ApplicationRecord
  belongs_to :category
  has_many :completed_tests

  def self.sort_by_category(category)
    Test.pluck(:title).joins(:category).where(categories: { title: category }).order(title: :desc)
  end
end
