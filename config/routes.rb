Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  
  root to: 'profiles#index'
  
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  

  #resources :users, only: [:index, :show, :new, :create]
  resources :users
  #後でeditとupdateを追記するかも、userのプロフィール画面の編集は付け足したほうが良い
  
  resources :profiles do
    resources :comments
  end
  #これはcreate, destroyを失くす必要があるかも、コメントはprofiles#showに書くつもりだから
end
