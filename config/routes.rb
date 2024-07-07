# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
  end

  resources :profiles, only: :show do
    post :subscribe, to: 'profiles#subscribe', on: :member
    delete :unsubscribe, to: 'profiles#unsubscribe', on: :member
  end

  get 'friends', to: 'friendships#index', as: 'friends'
end
