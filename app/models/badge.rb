class Badge < ApplicationRecord
  belongs_to :category
  belongs_to :badge_rule
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
