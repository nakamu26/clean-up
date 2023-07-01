Rails.application.routes.draw do
  devise_for :users
  root to: "normal_reports#index"
  resources :normal_reports, only: [:index, :new, :create, :show, :edit, :update]
end
