Rails.application.routes.draw do
  resources :users, only: [] do
    member do
      post 'follow'
      delete 'unfollow'
      get 'followings/sleep_records', to: 'users#followings_sleep_records'
    end
  end

  resources :sleep_records, only: [:create, :index]
end
