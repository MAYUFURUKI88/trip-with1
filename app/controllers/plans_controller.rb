class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.create(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
    redirect_to root_path unless current_user.id == @plan.user_id
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plan_path
    else
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to root_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :image, :trip_id, :first_day, :final_day, :price, :capacity_id, :deadline, :message).merge(user_id: current_user.id)
  end
end
