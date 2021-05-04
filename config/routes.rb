Rails.application.routes.draw do
    root 'homes#top'
  get 'home/about' => 'homes#about'
  
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update,] do
    get :follower, on: :member
    get :followed, on: :member
  end

  
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  
end