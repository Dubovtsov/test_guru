class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    respond_to do |format|
      if @badge.save
        format.html { redirect_to admin_badge_path(@badge), notice: 'Badge was successfully created.' }
        format.json { render :show, status: :created, location: @badge }
      else
        format.html { render :new }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to admin_badge_path(@badge), notice: 'Badge was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge }
      else
        format.html { render :edit }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @badge.destroy
    respond_to do |format|
      format.html { redirect_to admin_badges_path, notice: 'Badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :image, :category_id, :badge_rule_id)
    end
end
