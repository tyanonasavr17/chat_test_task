class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.create(message_params)
    if @message.save
      broadcast_to_chat(@message.chat)
      respond_to do |format|
        format.html { redirect_to @chat }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@chat) }
      end
    else
      raise 'Не удалось создать сообщение'
    end
  end


  private

  def message_params
    params.permit(:content)
  end
end
