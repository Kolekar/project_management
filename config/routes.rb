# frozen_string_literal: true

Rails.application.routes.draw do
  get 'developers' => 'developers#index'

  root 'dashboard#index'
  resources :tasks, only: %i[index update]
  resources :projects do
    resources :tasks, only: %i[new create]
  end
  devise_for :developers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
