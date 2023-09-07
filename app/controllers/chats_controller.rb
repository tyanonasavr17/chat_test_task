class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    @messages = @chat.messages
  end

  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      turbo_stream.append @chat, target: "chats"
    else
      render :index
    end
  end

  private

  def chat_params
    params.permit(:name)
  end
end
