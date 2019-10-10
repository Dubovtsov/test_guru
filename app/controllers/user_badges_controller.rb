class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_badges = UserBadge.all.where(user_id: current_user.id)
  end

  private

  def find_user_badge
    @user_badge = UserBadge.find(params[:id])
  end

end
