Rails.application.routes.draw do

  root 'chats#index'

  get :all_chats, to: 'chats#all_chats' # отображение списка чатов в формате json

  resources :chats do
    resources :messages, only: [:create] # создание сообщений в чате
  end

end
