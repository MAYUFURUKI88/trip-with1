class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @plans = Plan.all.page(params[:page]).per(6)
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

  def search
    @plans = Plan.search(params[:keyword])
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :image, :trip_id, :first_day, :final_day, :price, :capacity_id, :deadline, :message).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
