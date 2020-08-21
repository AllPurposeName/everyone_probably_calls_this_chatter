Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'users#pick_user'
  get 'user/signin/:id', to: 'users#sign_in', as: :user_sign_in
  resources :messages, only: [:create]
  resources :chat_rooms, only: [:index, :show]
end
