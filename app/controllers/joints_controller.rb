class JointsController < ApplicationController

  def show
    
  end


  def create
    @plan = Plan.find(params[:plan_id])
    unless Joint.find_by(user_id: current_user.id, plan_id: @plan.id)
      Joint.create(user_id: current_user.id, plan_id: @plan.id)
    redirect_to plan_joints_path
    else
    render "plans/show"
    end
  end

  
end
