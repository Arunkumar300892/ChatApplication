Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chat_rooms do
    resources :messages do
      collection do
        get 'dynamic_call'
      end
    end
  end

  root 'chat_rooms#index'

  devise_for :users

  # ActionCable routes
  mount ActionCable.server => '/cable'
end
