class Badge < ApplicationRecord
  belongs_to :category
  belongs_to :badge_rule
end
