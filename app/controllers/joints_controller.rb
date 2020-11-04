class JointsController < ApplicationController

  def show
  end


  def create
    @plan = Plan.find(params[:id])
    @user = current_user.id
    @plan.save
    @user.save
    redirect_to joint_path
  end

end
