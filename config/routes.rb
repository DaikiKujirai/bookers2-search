Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end