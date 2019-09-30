class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge


  def reward
    current_user.badges.push(@badge)
  end
end
