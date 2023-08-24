Rails.application.routes.draw do

  root to: 'prototypes#index' 
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :categories, only: [:index]  # カテゴリーに関するルートを追加
  resources :prototypes, only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    member do
      post "like", to: "prototypes#like"
    end
    resources :comments, only: [:create]
    resources :likes, only: [:create]
    collection do
      get 'search'
    end
  end

  get 'categories', to: 'categories#index' # カテゴリー一覧ページへのルートを追加
  get 'groups', to: 'groups#index' # グループ一覧ページへのルートを追加
end
