class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  private

    def set_badge
      @badge = Badge.find(params[:id])
    end

end
