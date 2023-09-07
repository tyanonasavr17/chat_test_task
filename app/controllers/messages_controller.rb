class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    byebug
    @message = @chat.messages.create(message_params)
    respond_to do |format|
      if @message.save
        format.turbo_stream
      else
        format.html { render :new }
      end
    end
  end

  private

  def message_params
    params.permit(:content)
  end
end
