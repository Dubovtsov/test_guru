class BadgeRule < ApplicationRecord
  has_many :badges, dependent: :destroy
end
