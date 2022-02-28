Rails.application.routes.draw do
  namespace :admin do
    get 'recipes/edit'
    get 'recipes/index'
    get 'recipes/show'
  end
  namespace :admin do
    get 'tags/edit'
    get 'tags/index'
  end
  namespace :admin do
    get 'mikans/show'
    get 'mikans/edit'
    get 'mikans/index'
    get 'mikans/new'
  end
  namespace :admin do
    get 'users/show'
    get 'users/edit'
    get 'users/index'
  end
  namespace :public do
    get 'recipes/show'
    get 'recipes/edit'
    get 'recipes/index'
    get 'recipes/new'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'mikans/index'
    get 'mikans/show'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
