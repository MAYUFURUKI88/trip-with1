class MessagesController < ApplicationController
  def new
    @messages = Message.where(plan_id: params[:plan_id]).includes(:user)
    @message = Message.new
    @plan = Plan.find(params[:plan_id])
  end

  def create
    @message = Message.new(text: params[:text], plan_id: params[:plan_id], user_id: current_user.id)
    ActionCable.server.broadcast 'message_channel', content: @message if @message.save
  end
end
