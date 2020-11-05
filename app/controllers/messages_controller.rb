class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
    @plan = Plan.find(params[:plan_id])
  end

  def create
    @message = Message.new(text: params[:text])
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end
end
