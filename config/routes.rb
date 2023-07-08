Rails.application.routes.draw do
  devise_for :users
  root to: 'normal_reports#index'
  resources :normal_reports, only: [:index, :new, :create, :show, :edit, :update] do
    resources :check_normal_reports, only: [:create]
  end
  resources :special_reports, only: [:new, :create, :show, :edit, :update]
  resources :illegal_reports, only: [:new, :create, :show, :edit, :update]
end
