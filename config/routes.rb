Rails.application.routes.draw do

  root 'chats#index'

  resources :chats do
    post :create
    resources :messages
  end

end
