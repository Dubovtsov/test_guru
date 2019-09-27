class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_badges = UserBadge.all
  end

  private

  def find_user_badge
    @user_badge = UserBadge.find(params[:id])
  end

end
