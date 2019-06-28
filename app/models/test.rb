class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level, case_sensitive: false }
  validates :level, numericality: { :greater_than_or_equal_to => 0 }

  scope :easy,      -> { where(level: 0..1) }
  scope :medium,    -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_category, -> (category) { pluck(:title).joins(:category).where(categories: { title: category }) }
end
