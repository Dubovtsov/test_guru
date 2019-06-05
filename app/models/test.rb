class Test < ApplicationRecord
  belongs_to :category

  def self.sort_by_category(category)
    Test.select(:title).joins(:category).where(categories: { title: category }).order(title: :desc)
  end
end
