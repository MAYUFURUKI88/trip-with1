class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
    @plan = Plan.find(params[:plan_id])
  end

  def create
    @message = Message.new(text: params[:message][:text])
  end
end
