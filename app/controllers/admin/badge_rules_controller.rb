class Admin::BadgeRulesController < Admin::BaseController
  before_action :set_badge_rule, only: [:show, :edit, :update, :destroy]

  def index
    @badge_rules = BadgeRule.all
  end

  def show
  end

  def new
    @badge_rule = BadgeRule.new
  end

  def edit
  end

  def create
    @badge_rule = BadgeRule.new(badge_rule_params)

    respond_to do |format|
      if @badge_rule.save
        format.html { redirect_to admin_badge_rule_path(@badge_rule), notice: 'Rule was successfully created.' }
        format.json { render :show, status: :created, location: @badge_rule }
      else
        format.html { render :new }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @badge_rule.update(badge_rule_params)
        format.html { redirect_to admin_badge_rule_path(@badge_rule), notice: 'Rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge_rule }
      else
        format.html { render :edit }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @badge_rule.destroy
    respond_to do |format|
      format.html { redirect_to admin_badge_rules_path, notice: 'Rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_badge_rule
    @badge_rule = BadgeRule.find(params[:id])
  end

  def badge_rules_params
    params.require(:badge_rule).permit(:name)
  end
end
