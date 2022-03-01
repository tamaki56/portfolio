Rails.application.routes.draw do
#会員
  scope module: :public do
    root to: 'mikans#index'
    resources :mikans, only: [:show]
    get 'user/:id/my_page' => 'users#show', as: 'my_page'
    resources :users, only: [:edit, :update]do
       get :favorites, on: :collection
    end
    resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]do
      resource :favorites, only: [:create, :destroy]
    end
 end
  # 顧客用
# URL /customers/sign_in ...
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 
  #管理者
  namespace :admin do
    resources :mikans
    resources :tags, only: [:index,:edit,:create,:update, :destroy]
    resources :users, only: [:index,:show,:edit,:update, :destroy]
    resources :recipes, only: [:index, :show, :edit, :update, :destroy]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
