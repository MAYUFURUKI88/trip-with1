class JointsController < ApplicationController

  def show
    
  end


  def create
    @plan = Plan.find(params[:id])
    redirect_to joint_path(@plan.id)
    end
  end

end
