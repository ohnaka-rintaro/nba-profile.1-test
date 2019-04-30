Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  
  root to: 'profiles#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  delete 'delete', to: 'users#destroy'
  
  get 'search', to: 'profiles#search'
  

  #resources :users, only: [:index, :show, :new, :create]
  resources :users
  #後でeditとupdateを追記するかも、userのプロフィール画面の編集は付け足したほうが良い
  
  resources :profiles do
    resources :comments, only: [:create, :destroy]
  end
  #これはcreate, destroyを失くす必要があるかも、コメントはprofiles#showに書くつもりだから
  
  resources :topics do
    resources :posts, only: [:create, :destroy]
  end
  
end
