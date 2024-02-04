# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts do
    resources :comments, only: %i[create update destroy], shallow: true
  end
end
