Rails.application.routes.draw do
  devise_for :users
  root to: "normal_reports#index"
end
