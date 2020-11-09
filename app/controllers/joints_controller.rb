class JointsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    if Joint.find_by(user_id: current_user.id, plan_id: @plan.id)
      render 'plans/show'
    else
      Joint.create(user_id: current_user.id, plan_id: @plan.id)
      redirect_to new_plan_message_path
    end
  end
end
