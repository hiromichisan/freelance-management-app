Rails.application.routes.draw do
  resources :expenses
  root "dashboard#index"  # rootルートをdashboard#indexに設定
  resources :invoices
  resources :contracts
  devise_for :users
  resources :expenses  # ここに追加


  # その他のルート
  get "up" => "rails/health#show", as: :rails_health_check
end
