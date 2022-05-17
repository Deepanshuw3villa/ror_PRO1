Rails.application.routes.draw do
  get 'category/index'
  get 'comments/index'
  get 'articles/index'
  root 'articles#index'
  resources :categories
  resources :articles do
    resources :comments
  end
end
