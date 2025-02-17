Rails.application.routes.draw do
  resources :posts
  root 'posts#index' # Trang chủ


  # Defines the root path route ("/")
  # root "posts#index"
end
