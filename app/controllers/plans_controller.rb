class PlansController < ApplicationController
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
=======

  end

  private

  def plan_params
    params.require(:plan).permit(:title, :image, :trip_id, :first_day, :final_day, :price, :capacity_id, :deadline, :message).merge(user_id: current_user.id)
  end

end

