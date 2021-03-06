Rails.application.routes.draw do
  root "forum_threads#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :forum_threads, only: [:show, :new, :create] do
    resources :forum_posts, only: [:create]
  end
end
